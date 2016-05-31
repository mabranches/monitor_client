require 'rest-client'

class Client
   def initialize(config)
     @api_base = config.api_base
     @instance_id = config.instance_id
   end

   def send_usage(usage)
      RestClient.post("#{@api_base}/instances/#{@instance_id}",
        {instance: usage})
   end
end
