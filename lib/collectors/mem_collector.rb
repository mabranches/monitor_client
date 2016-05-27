
class MemCollector < Collector
  def execute
    `free | grep Mem | awk '{ printf("%.1f", $4/$2 * 100.0) }'`.to_f.round
  end

  def type
    :mem
  end
  
end
