class Developer
  def initialize
    @state = SadDev.new
  end

  def drinkCoffee
    @state = HappyDev.new

    Thread.new do
      sleep(5)
      @state = SadDev.new
    end
  end

  def work
    @state.work
  end
end

class HappyDev
  def work
    p 'works a lot'
  end
end

class SadDev
  def work
    p 'Asks for a raise'
  end
end

joao = Developer.new
joao.work

joao.drinkCoffee
joao.work

sleep(6)
joao.work
