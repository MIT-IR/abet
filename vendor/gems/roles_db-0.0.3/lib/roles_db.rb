require 'roles_db/configuration'
require 'roles_db/account'
require 'roles_db/roles'
require 'roles_db/local_roles'
require 'savon'
require 'yaml'

module RolesDb
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.reset
    @configuration = Configuration.new
    @client = nil
  end

  def self.client
    klass = constantize(@configuration.strategy_class)
    @client ||= klass.new
  end

  def self.constantize(camel_cased_word)
    names = camel_cased_word.split('::')

    # Trigger a builtin NameError exception including the ill-formed constant in the message.
    Object.const_get(camel_cased_word) if names.empty?

    # Remove the first blank element in case of '::ClassName' notation.
    names.shift if names.size > 1 && names.first.empty?

    names.inject(Object) do |constant, name|
      if constant == Object
        constant.const_get(name)
      else
        candidate = constant.const_get(name)
        next candidate if constant.const_defined?(name, false)
        next candidate unless Object.const_defined?(name)

        # Go down the ancestors to check it it's owned
        # directly before we reach Object or the end of ancestors.
        constant = constant.ancestors.inject do |const, ancestor|
          break const    if ancestor == Object
          break ancestor if ancestor.const_defined?(name, false)
          const
        end

        # owner is in Object, so raise
        constant.const_get(name, false)
      end
    end
  end
end
