class CPUCollector < Collector
  def execute
    `cat /proc/loadavg | awk  '{print $1}'`.to_f.round
  end

  def type
    :cpu
  end
  
end
