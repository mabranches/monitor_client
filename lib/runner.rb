require 'logger'
class Runner

  def initialize(config, collectors)
    @config = config
    @log = Logger.new(config.log_path)
    @collectors = collectors.collect{|collector_class|  collector_class.new(@log)}
  end

  def run
    while true do
      RunnerBlock.run_block(@config, @collectors, @log)
    end
  end
end

class RunnerBlock

  def self.run_block(config, collectors, log)
    client = Client.new(config)
    usage = {}
    sleep(config.seconds)
      collectors.each do |collector|
        begin
          collector.collect
          usage[collector.type] = collector.usage
        rescue => e
          puts "Could not collect with #{collector.class.name}. #{e.message}"
          log.error("Could not collect with #{collector.class.name}. #{e.message}")
        end
      end
      begin
        client.send_usage(usage)
      rescue => e
        puts "Could not send usage status to api. #{e.message}"
        log.error("Could not send usage status to api. #{e.message}")
      end
  end

end
