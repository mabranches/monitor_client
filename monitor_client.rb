require 'rest-client'
require './lib/config.rb'
require './lib/collector.rb'
require './lib/client.rb'
require './lib/runner.rb'
Dir["./lib/collectors/*.rb"].each {|file| require file }

config = Config.new
collectors = [
  DiskCollector,
  MemCollector,
  CPUCollector,
  ProcessCollector
]

Runner.new(config, collectors).run
