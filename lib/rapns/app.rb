module Rapns
  class App < ActiveRecord::Base
    self.table_name = 'rapns_apps'
    self.store_full_sti_class = true

    if Rapns.attr_accessible_available?
      attr_accessible :name, :environment, :certificate, :password, :connections, :auth_key
    end

    has_many :notifications, :class_name => 'Rapns::Notification', :dependent => :destroy

    validates_presence_of :name
    validates_uniqueness_of :name, :scope => [:type, :environment]
    validates_numericality_of :connections, :greater_than => 0, :only_integer => true
  end
end
