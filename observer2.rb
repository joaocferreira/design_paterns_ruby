module Subject
  def subscribe(description, l)
    @lambdas[description] = l
    self
  end
  def unsubscribe(description)
    @lambdas.delete(description)
    self
  end
  def publish(data)
    @lambdas.values.each do |l|
      l.call data
    end
    self
  end
end

class Observable
  include Subject
  def initialize
    @lambdas = {}
  end
end


lambda1 = -> (d) { p "#{d} world!"}
lambda2 = -> (d) { p "#{d} dude!"}

observable = Observable.new
  .subscribe(:world, lambda1)
  .subscribe(:dude, lambda2)

observable
  .publish('Hello')
  .publish('Goodbye')

observable
  .unsubscribe(:dude)
  .publish('Laters')

observable
    .publish('See you')
