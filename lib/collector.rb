class Collector
  attr_reader :usage, :error
  def initialize(log)
    @log = log
    @error = nil
    @usage = nil
  end

  def collect
    @error = nil
    @usage = execute
    rescue Exception => e
      @error = e.message
      @log.error(e.message)
      raise e
  end
end
