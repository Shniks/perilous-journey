require './lib/node'
require 'pry'

class LinkedList

    attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(surname, supplies)
    @count += 1
    if head.nil?
      append_node_if_head_nil(surname, supplies)
    else
      append_node_if_head_not_nil(surname, supplies)
    end
  end

  def append_node_if_head_nil(surname, supplies)
    first_string(surname)
    @head = Node.new(surname, supplies)
  end

  def first_string(surname)
    @string = "The #{surname} family"
  end

  def append_node_if_head_not_nil(surname, supplies)
    current_node = head
    append_traverse(current_node, surname, supplies)
  end

  def append_traverse(current_node, surname, supplies)
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    insert_node_after_current_node(current_node, surname, supplies)
  end

  def insert_node_after_current_node(current_node, surname, supplies)
    rest_of_the_string(surname)
    current_node.next_node = Node.new(surname, supplies)
  end

  def rest_of_the_string(surname)
    @string += ", followed by the #{surname} family"
  end

  def to_string
    @string
  end

  def prepend(surname, supplies)
    prepend_string(surname)
    @count += 1
    prepend_insert_node(surname, supplies)
  end

  def prepend_insert_node(surname, supplies)
    current_head = @head
    @head = Node.new(surname, supplies)
    head.next_node = current_head
  end

  def prepend_string(surname)
    @string = "The #{surname} family" + @string.gsub("The", ", followed by the")
  end

  def insert(position, surname)
    @count += 1
    current_node = head
    insert_traverse(position, current_node, surname)
  end

  def insert_traverse(position, current_node, surname)
    (position - 1).times do
      current_node = current_node.next_node
    end
    insert_the_node(surname, current_node, position)
  end

  def insert_the_node(surname, current_node, position)
    inserted_node = Node.new(surname)
    insert_string(surname, position)
    inserted_node.next_node = current_node.next_node
    current_node.next_node = inserted_node
  end

  def insert_string(surname, position)
    @string = @string.split(",").insert((position), " followed by the #{surname} family").join(",")
  end

  def find(position, number)
    current_node = head
    find_traverse(position, current_node, number)
  end

  def find_traverse(position, current_node, number)
    (position).times do
      current_node = current_node.next_node
    end
    find_string(current_node, number)
  end

  def find_string(current_node, number)
    first_string(current_node.surname)
    (number - 1).times do
      current_node = current_node.next_node
      rest_of_the_string(current_node.surname)
    end
    to_string
  end

  def includes?(surname)
    current_node = head
    while !current_node.nil?
      return true if current_node.surname == surname
      current_node = current_node.next_node
    end
    false
  end

  def pop
    current_node = head
    pop_count
    pop_string
    pop_traverse(current_node)
  end

  def pop_count
    @count -= 1
  end

  def pop_string
    @string = @string.split(",")[0..-2].join(",")
  end

  def pop_traverse(current_node)
    while !current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    pop_outputs(current_node)
  end

  def pop_outputs(current_node)
    print "The #{current_node.next_node.surname} family has died of dysentery"
    pop_delete_node(current_node)
  end

  def pop_delete_node(current_node)
    target = current_node.next_node
    current_node.next_node = nil
    target
  end

end
