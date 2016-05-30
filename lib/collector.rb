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
  end
end
