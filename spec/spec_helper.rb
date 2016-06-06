require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

require 'rspec'
require 'byebug'
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/*/*.rb"].each {|file| require file }
