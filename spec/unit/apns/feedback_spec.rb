require File.expand_path("spec/unit_spec_helper")

describe Rapns::Apns::Feedback do
  it "should validate the format of the device_token" do
    notification = Rapns::Apns::Feedback.new(:device_token => "{$%^&*()}")
    notification.valid?.should be_false
    notification.errors[:device_token].should include("is invalid")
  end
end
