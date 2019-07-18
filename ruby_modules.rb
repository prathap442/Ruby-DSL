require 'pry'
module Configurable
  def macha
    return "le macha"
  end
  def macha_two
    return "le macha two"
  end
end

class RubyMdulos
  include Configurable # so here macha and macha_two are becoming the instance methods
end

r1 = RubyMdulos.new
puts r1.macha # le macha
puts r1.macha_two # le macha two