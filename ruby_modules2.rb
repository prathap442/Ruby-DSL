require 'pry'


# converting the instance methods of the module when included in another class and making them as the class Methods

module Configurable
  def self.included(host_class)
    binding.pry
    host_class.extend ClassMethods
  end

  module ClassMethods
    def macha
      return "le macha"
    end
    def macha_two
      return "le macha two"
    end
  end
end

class RubyModules
  include Configurable
end


binding.pry
RubyModules.macha # "le macha"
RubyModules.macha_two # "le macha two"