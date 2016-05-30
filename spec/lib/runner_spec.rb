require 'spec_helper'
describe RunnerBlock do
 before do
   @log = Logger.new(STDOUT)
   allow(RestClient).to receive(:get) {"test"}
   allow(RestClient).to receive(:post) {}
   allow(YAML).to receive(:load) do
     {
       "log_path" => 'test.log',
       "seconds" => 1,
       "api_base" => 'http://teste.com'
     }
   end
   @config = Config.new
   @client = Client.new(@config)
   @collector = Collector.new(@log)
 end
 describe "Fails to send usage" do
   before do
     allow(@client).to receive(:send_usage) {raise "test error"}
     allow(@collector).to receive(:execute) {}
     @collectors = [@collector]
   end
   it "should write log but not raise exception" do
      expect(@log).to receive(:error)
      expect do
        described_class.run_block(@config, @collectors, @log)
      end.to_not raise_error
   end
 end
 describe "Erro to execute collector command" do
   before do
     allow(@client).to receive(:send_usage) {}
     allow(@collector).to receive(:execute) {raise "test error"}
     @collectors = [@collector]
   end
   it "should write log but not raise exception" do
      expect(@log).to receive(:error)
      expect do
        described_class.run_block(@config, @collectors, @log)
      end.to_not raise_error
   end
 end
 describe "Execute successfully" do
   before do
     allow(@client).to receive(:send_usage) {}
     allow(@collector).to receive(:execute) {}
     allow(@collector).to receive(:type) {:test_collector}
     @collectors = [@collector]
   end
   it "shouldnt write to log nor raise exception" do
      expect(@log).to_not receive(:error)
      expect do
        described_class.run_block(@config, @collectors, @log)
      end.to_not raise_error
   end
 end
end
