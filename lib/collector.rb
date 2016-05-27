class Collector
  attr_reader :usage, :error
  def initialize
    @error = nil
    @usage = nil
  end
  
  def collect
    @error = nil
      @usage = execute 
    rescue Exception => e
      @error = e.message
      #log errror
  end
end
