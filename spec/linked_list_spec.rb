require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/linked_list'
require 'pry'

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

    expect(@list.head).to be_a Node
    expect(@list.head.surname).to eq("West")
    expect(@list.head.next_node).to eq(nil)
  end

  it 'can count all the nodes in the list' do
    @list.append("West")

    expect(@list.count).to eq(1)
  end

  it 'can generate a string of all elements in the list' do
    @list.append("West")

    expect(@list.to_string).to eq("The West family")
  end

  it 'can append, to_string and count for two nodes' do
    @list.append("Rhodes")

    expect(@list.head.surname).to eq("Rhodes")
    expect(@list.head.next_node).to eq(nil)

    @list.append("Hardy")

    expect(@list.head.next_node).to be_a Node
    expect(@list.head.next_node.surname).to eq("Hardy")
    expect(@list.head.next_node.next_node).to eq(nil)
    expect(@list.count).to eq(2)
    expect(@list.to_string).to eq("The Rhodes family, followed by the Hardy family")
  end

  it 'can append, to_string and count for four nodes' do
    @list.append("Rhodes")

    expect(@list.head.surname).to eq("Rhodes")
    expect(@list.head.next_node).to eq(nil)

    @list.append("Hardy")
    @list.append("Powell")
    @list.append("McConnell")

    expect(@list.count).to eq(4)
    expect(@list.to_string).to eq("The Rhodes family, followed by the Hardy family, followed by the Powell family, followed by the McConnell family")
  end

end
