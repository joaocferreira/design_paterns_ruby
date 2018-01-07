class CompositeTask
  def initialize
    @steps = []
  end
  def add_step(step)
    @steps << step
  end
  def remove_step(step)
    @steps.delete(step)
  end
  def time_required
    @steps.reduce(0) do |sum, step|
        sum + step.time_required
    end
  end
end

class LeafTask
  attr_reader :time_required

  def initialize(time_required)
    @time_required = time_required
  end
end

grind_coffee = LeafTask.new(2)
boil_water = LeafTask.new(3)
add_water = LeafTask.new(1)

mix_coffee = CompositeTask.new
mix_coffee.add_step(boil_water)
mix_coffee.add_step(add_water)

coffee = CompositeTask.new
coffee.add_step(grind_coffee)
coffee.add_step(mix_coffee)

p   "#{coffee.time_required} mins required"

mix_coffee.remove_step(add_water)

p   "#{coffee.time_required} mins required"
