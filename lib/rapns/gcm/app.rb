module Rapns
  module Gcm
    class App < Rapns::App
      validates_presence_of :auth_key
    end
  end
end