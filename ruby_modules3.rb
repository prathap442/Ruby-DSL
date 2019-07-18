class MyApp
  #BOLD
  include Configurable.with(:app_id, :title, :cookie_name)
  #BOLDEND    
    # ...
end

module Configurable
  def self.included(host_name)
    host_name.extend ClassMethods
  end

  module ClassMethods
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
  class Configuration
    attr_accessor :app_id,:title,:cookie_name
  end
end