require 'rest-client'
require './lib/config.rb'
require './lib/collector.rb'
Dir["./lib/collectors/*.rb"].each {|file| require file }
require './lib/client.rb'

config = Config.new
client = Client.new(config)
collectors = []
collectors << DiskCollector.new
collectors << MemCollector.new
collectors << CPUCollector.new

usage = {instance_id: config.instance_id}

while true do

  sleep(config.seconds)
  collectors.each do |collector|
    collector.collect
    usage[collector.type] = collector.usage || 0
  end
 
  if (!client.send_usage(usage))
    log.error("Could not send usage status to api. #{collector.error}")
  end
    
end

