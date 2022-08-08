require './lib/node'
require 'pry'

class LinkedList

    attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(surname)
    @count += 1
    if head.nil?
      append_node_if_head_nil(surname)
    else
      append_node_if_head_not_nil(surname)
    end
  end

  def append_node_if_head_nil(surname)
    @string = "The #{surname} family"
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
    @string += ", followed by the #{surname} family"
    current_node.next_node = Node.new(surname)
  end

  def to_string
    @string
  end

  def prepend(surname)
    prepend_string(surname)
    @count += 1
    prepend_insert_node(surname)
  end

  def prepend_insert_node(surname)
    current_head = @head
    @head = Node.new(surname)
    head.next_node = current_head
  end

  def prepend_string(surname)
    @string = "The #{surname} family" + @string.gsub("The", ", followed by the")
  end

end
