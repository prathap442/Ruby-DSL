require 'pry'
class MyApp
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end

  class Configuration
    attr_accessor :app_id, :title, :cookie_name
  end
end


class Product
  class << self
    def name
      yield
    end
  end
end


c1 = MyApp.configure do |config|
  config.app_id = "my_app app_id"
  config.title = "My App title"
  config.cookie_name = "my_app_session cookie"
end
binding.pry
puts c1
binding.pry
puts MyApp.config
binding.pry
puts MyApp.config.app_id
m1 =  MyApp::Configuration.new
puts m1.app_id # this is giving a white space
c1 = Product.name { puts "this is the product name" }
