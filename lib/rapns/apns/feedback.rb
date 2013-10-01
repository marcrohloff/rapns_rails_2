module Rapns
  module Apns
    class Feedback < ActiveRecord::Base
      self.table_name = 'rapns_feedback'

      if Rapns.attr_accessible_available?
        attr_accessible :device_token, :failed_at, :app
      end

      validates_presence_of :device_token
      validates_presence_of :failed_at

      validates_with Rapns::Apns::DeviceTokenFormatValidator
    end
  end
end
