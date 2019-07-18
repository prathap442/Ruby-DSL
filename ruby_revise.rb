require 'pry'
module Configurable
  def self.with(*attrs)
    config_class = Class.new do
      attr_accessor *attrs
    end

    class_methods = Module.new do
      define_method :config do
        @config ||= config_class.new
      end
      def configure
        yield config
      end
    end

    Module.new do
      binding.pry
      singleton_class.send :define_method, :included do |host_class|
        binding.pry
        host_class.extend(class_methods)
      end
    end
  end
end

class MyApp
  include Configurable.with(:app_name,:app_id,:cookie_name)
end

MyApp.configure do |config|
  config.app_name = "hare"
  config.app_id = "384209"
  config.cookie_name = "sfsjdlfj"
end

puts MyApp.config.app_id