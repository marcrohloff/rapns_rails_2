shared_examples_for "an Notification subclass" do
  describe "when assigning data for the device" do
    before { Rapns::Deprecation.stub(:warn) }

    it "calls MultiJson.dump when multi_json responds to :dump" do
      Object.stub_constants(:MultiJson => mock) do
        MultiJson.should_receive(:dump).with(any_args())
        notification = notification_class.new
        notification.send(data_setter, { :pirates => 1 })
      end
    end

    it "calls MultiJson.encode when multi_json does not respond to :dump" do
      Object.stub_constants(:MultiJson => mock) do
        notification = notification_class.new
        MultiJson.should_receive(:encode).with(any_args())
        notification.send(data_setter, { :ninjas => 1 })
      end
    end

    it "raises an ArgumentError if something other than a Hash is assigned" do
      expect do
        notification.send(data_setter, Array.new)
      end.to raise_error(ArgumentError, "must be a Hash")
    end

    it "encodes the given Hash as JSON" do
      notification.send(data_setter, { :hi => "mom" })
      notification.read_attribute(:data).should == "{\"hi\":\"mom\"}"
    end

    it "decodes the JSON when using the reader method" do
      notification.send(data_setter, { :hi => "mom" })
      notification.send(data_getter).should == {"hi" => "mom"}
    end

    if Rapns.is_rails2_or_3?
      it 'warns if attributes_for_device is assigned via mass-assignment' do
        RAILS_DEFAULT_LOGGER.stub!(:debug)
        Rapns::Deprecation.should_receive(:warn).with(':attributes_for_device via mass-assignment is deprecated. Use :data or the attributes_for_device= instance method.')
        notification_class.new(:attributes_for_device => {:hi => 'mom'})
      end
    end
  end
end
