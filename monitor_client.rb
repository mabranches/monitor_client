require 'lib/config'
require 'lib/hd_collector'
require 'lib/mem_collector'
require 'lib/cpu_collector'

config = Config.new(config_path)
client = config.get_client_instance
collectors = []
collectors << HdCollector.new
collectors << MemCollector.new
collectors << CPUCollector.new

#remove the \n char from localhost
usage = {name: `localhost`[0..-3]}

while true do

  sleep(config.seconds)
  collectors.each do |collector|
    if error = collector.collect
      usage[collector.type] = collector.usage
    else
      log.error(collector.error)
    end
  end
  client_status = client.send_usage(usage) unless_error 
  
  error = false
    
end

