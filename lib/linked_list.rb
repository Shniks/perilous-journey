require './lib/node'
require 'pry'

class LinkedList

    attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(surname)
    @head = Node.new(surname)
    @count += 1
  end

  def to_string
    "The #{@head.surname} family"
  end

end
