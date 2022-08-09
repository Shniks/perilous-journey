class WagonTrain

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(surname)
    list.append(surname)
  end

end
