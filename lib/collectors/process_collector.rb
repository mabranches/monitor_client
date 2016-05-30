class ProcessCollector < Collector
  def execute
    ps_out = `ps aux| grep -v COMMAND|awk '{print $1" "$2" "$3" "$4" "$11}'`.split "\n"
    ps_hash = {}
    
    ps_out.each_with_index do |line, i| 
      fields = line.split ' '
      ps_hash[i] = {user:fields [0], pid:fields [1], cpu:fields [2], mem:fields [3], command:fields [4]}
    end
    
    ps_hash
  end

  def type
    :process
  end
end

