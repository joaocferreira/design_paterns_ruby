class Context1
  attr_reader :text, :name
  def initialize
    @text = 'Hello'
    @name = 'joao'
  end
end

class Context2
  attr_reader :a, :b
  def initialize
    @a = 'Hi'
    @b = 'joao'
  end
end

module Consumer
  def self.say_hello(context)
    p "#{context.text} #{context.name}!"
  end
end

class Adapter
  def initialize(context)
    @context = context
  end
  def text
    @context.a
  end
  def name
    @context.b
  end
end

Consumer.say_hello(Context1.new)
Consumer.say_hello(Adapter.new(Context2.new))

a = Context2.new
class << a
  def text
    a
  end
  def name
    b
  end
end

Consumer.say_hello(a)

b = Context2.new
def b.text
  a
end
def b.name
  b
end
Consumer.say_hello(b)
