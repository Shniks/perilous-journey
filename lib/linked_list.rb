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
      append_node_if_head_nil(surname)
    else
      append_node_if_head_not_nil(surname)
    end
    @count += 1
  end

  def append_node_if_head_nil(surname)
    @head = Node.new(surname)
  end

  def append_node_if_head_not_nil(surname)
    current_node = head
    append_traverse(current_node, surname)
  end

  def append_traverse(current_node, surname)
    append_traverse_if_next_node_not_nil(current_node)
    insert_node_after_current_node(current_node, surname)
  end

  def append_traverse_if_next_node_not_nil(current_node)
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
  end

  def insert_node_after_current_node(current_node, surname)
    current_node.next_node = Node.new(surname)
  end

  def to_string
    if @head.next_node.nil?
      @s = "The #{head.surname} family"
    else
      @s += ", followed by the #{@current_node.next_node.surname} family"
    end
  end

end
