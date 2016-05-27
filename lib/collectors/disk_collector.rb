class DiskCollector < Collector
  def execute
    df_exit = `df -h | awk '/dev/ {print $5}'| sed 's/%//'`
    df_exit.split("\n").collect(&:to_i).max
  end

  def type
    :disk
  end
  
end
