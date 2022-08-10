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

  def supplies
    supplies = Hash.new(0)
    current_node = list.head
    create_supplies(supplies, current_node)
  end

  def create_supplies(supplies, current_node)
    while !current_node.nil?
      supplies[current_node.supplies.keys.first] += current_node.supplies.values.first
      current_node = current_node.next_node
    end
    supplies
  end

end
