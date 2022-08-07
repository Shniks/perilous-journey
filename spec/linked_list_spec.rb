require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/linked_list'

RSpec.describe LinkedList do

  before do
    @list = LinkedList.new
  end

  it 'is an instance of an object' do
    expect(@list).to be_a LinkedList
  end

  it 'has attributes' do
    expect(@list.head).to eq(nil)
  end

  it 'can append a node' do
    @list.append("West")

    expect(@list.head.surname).to eq("West")
    expect(@list.head.next_node).to eq(nil)
  end

end