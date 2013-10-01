module Rapns
  module Gcm
    class ExpiryCollapseKeyMutualInclusionValidator < ActiveModel::Validator
      def validate(record)
        if record.collapse_key && !record.expiry
          record.errors.add(:expiry, "must be set when using a collapse_key")
        end
      end
    end
  end
end