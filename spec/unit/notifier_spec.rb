require File.expand_path("spec/unit_spec_helper")
require 'rapns/notifier'

describe Rapns::Notifier do

  before(:each) { @port = 5000 }
  subject { Rapns::Notifier.new('127.0.0.1', @port) }
  its(:socket) { should_not be_nil }

  context "when connected" do
    before :each do
      @reader = UDPSocket.new
      @reader.bind('127.0.0.1', 0)
      @port = @reader.addr[1]
    end

    describe "notify" do
      it "calls write on the socket" do
        sock = UDPSocket.new
        UDPSocket.should_receive(:new).and_return(sock)
        sock.should_receive(:write)

        subject.notify
      end

      it "writes data that can be read from socket" do
        subject.notify
        @reader.recvfrom(4096).should be_an(Array)
      end
    end
  end
end
