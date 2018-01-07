require 'observer'

class ArrayObservable
  include Observable

  def initialize(array)
    @array = array
  end

  def run
    index = 0

    @array.each do |value|
      changed #notify of change
      notify_observers value # send the current value
    end
    @array = []
  end
end

class ArrayObserver
  def initialize(observable)
    observable.add_observer(self)
  end
end

class ObserveEven < ArrayObserver
  def update(item)
    if item.even?
      p "#{item} is even"
    end
  end
end

class ObserveOdd < ArrayObserver
  def update(item)
    if item.odd?
      p "#{item} is odd"
    end
  end
end

observable = ArrayObservable.new([1,2,3,4,5])
ObserveEven.new(observable)
ObserveOdd.new(observable)
observable.run
observable.run
