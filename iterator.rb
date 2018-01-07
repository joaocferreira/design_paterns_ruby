# external iterator
class Iterator
  def initialize(*args)
    @array = args
    @index = 0
  end
  def show
    @array
  end
  def next?
    @index < @array.size
  end
  def do_each_one
    while next? do
        yield @array[@index]
        @index += 1
    end
  end
end

Iterator.new(1,2,3,4).do_each_one { |item| p item + 1}
# iterates

Iterator.new.do_each_one {|i| i}
# null
