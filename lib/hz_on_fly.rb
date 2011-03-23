require 'rubygems'
require 'unicode_japanese'

module HzOnFly
  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end

  module ClassMethods
    def hz_on_fly(*columns)
      option = columns.extract_options!

      columns.map do |column|
        define_method "#{column}=" do |value|
          super(Unicode::Japanese.send(option[:type], value))
        end
      end
    end
  end

  class Railtie < ::Rails::Railtie
    initializer 'hz_on_fly', :before => "active_record.set_dispatch_hooks" do
      ActiveRecord::Base.send(:include, HzOnFly)
    end
  end
end
