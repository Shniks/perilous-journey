require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/linked_list'

RSpec.describe LinkedList do
  it 'is an instance of an object' do
    list = Linkedlist.new

    expect(list).to be_a LinkedList
  end

end
