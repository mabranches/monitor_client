require 'yaml'
class Config
  attr_reader :api_base, :instance_id, :seconds, :log_path
  def initialize
    yml = YAML.load(File.read('config/application.yml'))
    @api_base = yml['api_base']
    @seconds = yml['seconds']
    @log_path = yml['log_path']
    @instance_id = RestClient.get('http://169.254.169.254/latest/meta-data/instance-id')
  end

end
