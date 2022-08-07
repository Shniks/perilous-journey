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

end
