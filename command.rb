STORE = ['water']

class AddCoffee
  def up
    STORE << 'coffee'
  end
  def down
    STORE.delete_at(STORE.find_index('coffee'))
  end
end

class Command
  def initialize(cmd)
      @cmd = cmd
  end

  def do
    @cmd.up
  end
  def undo
    @cmd.down
  end
end

a = Command.new(AddCoffee.new)

p STORE
a.do
p STORE
a.undo
p STORE
