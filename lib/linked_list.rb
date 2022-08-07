require './lib/node'
require 'pry'

class LinkedList

    attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(surname)
    if head.nil?
      @head = Node.new(surname)
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(surname)
    end
    @count += 1
  end

  def to_string
    "The #{@head.surname} family"
  end

end
