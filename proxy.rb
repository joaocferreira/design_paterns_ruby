class Original
  attr_accessor :a

  def initialize
    @a = 'Hello'
  end
end

class Proxy
  def initialize(original, name)
    @original = original
    @name = name
  end

  def a(name)
    @name == name ? @original.a : nil
  end
end

service = Proxy.new(Original.new, 'joao')

p service.a('joao')
p service.a('jose')
