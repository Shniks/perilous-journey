require './lib/node'
require 'pry'

class LinkedList

    attr_reader :head

  def initialize
    @head = nil
  end

  def append(surname)
    @head = Node.new(surname)
  end

end
