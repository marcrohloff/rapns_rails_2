require 'active_record/base'

module ActiveModel
  class Validator

    def initialize(options)

    end

  end
end

module ActiveRecord::Validations::ClassMethods


  def validates_with(*args, &block)
    options = args.extract_options!
    args.each do |klass|
      validator = klass.new(options, &block)
      validator.setup(self) if validator.respond_to?(:setup)

      #if validator.respond_to?(:attributes) && !validator.attributes.empty?
      #  validator.attributes.each do |attribute|
      #    _validators[attribute.to_sym] << validator
      #  end
      #else
      #  _validators[nil] << validator
      #end

      validate(validator, options)
    end
  end

end
