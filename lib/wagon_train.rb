class WagonTrain

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname, supplies)
    list.append(surname, supplies)
  end

  def count
    list.count
  end

end
