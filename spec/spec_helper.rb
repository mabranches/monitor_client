require 'simplecov'
SimpleCov.start

require 'rspec'
require 'byebug'
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/*/*.rb"].each {|file| require file }
