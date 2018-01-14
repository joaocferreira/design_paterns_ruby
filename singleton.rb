class Greeting
  def initialize
    @@msg = "Hello"
  end

  @@instance = Greeting.new

  def self.instance
    return @@instance
  end

  def self.log(name)
    p "#{@@msg} #{name}"
  end

  private_class_method :new
end

Greeting.log('joao')
