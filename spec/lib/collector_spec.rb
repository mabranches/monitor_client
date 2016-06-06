require 'spec_helper'

describe Collector  do
  before do
    allow(RestClient).to receive(:get) {"test"}
    allow(RestClient).to receive(:post) {}
  end

  context "correct execution" do
    it "should not log and not throw exception" do
      log = Logger.new(STDOUT)
      expect(log).not_to receive(:error)
      collector = Collector.new(log)
      allow(collector).to receive(:execute) {}
      allow(collector).to receive(:type) {'type'}
      expect{collector.execute}.not_to raise_error
    end
  end

  context "incorrect execution" do
    it "should not log error and throw exception" do
      log = Logger.new(STDOUT)
      expect(log).not_to receive(:error)
      collector = Collector.new(log)
      allow(collector).to receive(:execute) {raise StandardError, "execution error" }
      expect{collector.collect}.to raise_error(StandardError, "execution error")
    end
  end
end
