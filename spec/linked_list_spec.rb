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
    @list.append("West", {"pounds of food" => 200})

    expect(@list.head).to be_a Node
    expect(@list.head.surname).to eq("West")
    expect(@list.head.supplies).to eq({"pounds of food" => 200})
    expect(@list.head.next_node).to eq(nil)
  end

  it 'can count all the nodes in the list' do
    @list.append("West", {"pounds of food" => 200})

    expect(@list.count).to eq(1)
  end

  it 'can generate a string of all elements in the list' do
    @list.append("West", {"pounds of food" => 200})

    expect(@list.to_string).to eq("The West family")
  end

  it 'can append, to_string and count for two nodes' do
    @list.append("Rhodes", {"pounds of food" => 200})

    expect(@list.head.surname).to eq("Rhodes")
    expect(@list.head.supplies).to eq({"pounds of food" => 200})
    expect(@list.head.next_node).to eq(nil)

    @list.append("Hardy", {"pounds of food" => 200})

    expect(@list.head.next_node).to be_a Node
    expect(@list.head.next_node.surname).to eq("Hardy")
    expect(@list.head.next_node.supplies).to eq({"pounds of food" => 200})
    expect(@list.head.next_node.next_node).to eq(nil)
    expect(@list.count).to eq(2)
    expect(@list.to_string).to eq("The Rhodes family, followed by the Hardy family")
  end

  it 'can append, to_string and count for four nodes' do
    @list.append("Rhodes", {"pounds of food" => 200})

    expect(@list.head.surname).to eq("Rhodes")
    expect(@list.head.supplies).to eq({"pounds of food" => 200})
    expect(@list.head.next_node).to eq(nil)

    @list.append("Hardy", {"pounds of food" => 300})
    @list.append("Powell", {"pounds of food" => 500})
    @list.append("McConnell", {"pounds of food" => 150})

    expect(@list.count).to eq(4)
    expect(@list.to_string).to eq("The Rhodes family, followed by the Hardy family, followed by the Powell family, followed by the McConnell family")
  end

  it 'can prepend a node to the beginning of the list' do
    @list.append("Brooks", {"pounds of food" => 200})
    @list.append("Henderson", {"pounds of food" => 300})
    @list.prepend("McKinney", {"pounds of food" => 250})

    expect(@list.count).to eq(3)
    expect(@list.to_string).to eq("The McKinney family, followed by the Brooks family, followed by the Henderson family")

    @list.prepend("Rhodes", {"pounds of food" => 100})

    expect(@list.count).to eq(4)
    expect(@list.to_string).to eq("The Rhodes family, followed by the McKinney family, followed by the Brooks family, followed by the Henderson family")
  end

  it 'can insert a node to the the list' do
    @list.append("Brooks", {"pounds of food" => 200})
    @list.append("Henderson", {"pounds of food" => 300})
    @list.prepend("McKinney", {"pounds of food" => 250})
    @list.insert(1, "Lawson", {"pounds of food" => 100})

    expect(@list.count).to eq(4)
    expect(@list.to_string).to eq("The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family")
  end

  it 'can insert a second node to the the list' do
    @list.append("Brooks", {"pounds of food" => 200})
    @list.append("Henderson", {"pounds of food" => 300})
    @list.prepend("McKinney", {"pounds of food" => 250})
    @list.insert(1, "Lawson", {"pounds of food" => 100})
    @list.insert(3, "Rhodes", {"pounds of food" => 400})

    expect(@list.count).to eq(5)
    expect(@list.to_string).to eq("The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Rhodes family, followed by the Henderson family")
  end

  # it 'can find a one or more nodes in the list' do
  #   @list.append("Brooks")
  #   @list.append("Henderson")
  #   @list.prepend("McKinney")
  #   @list.insert(1, "Lawson")
  #
  #   expect(@list.find(2, 1)).to eq("The Brooks family")
  #   expect(@list.find(1, 3)).to eq("The Lawson family, followed by the Brooks family, followed by the Henderson family")
  # end
  #
  # it 'can find check to see if a node is in the list' do
  #   @list.append("Brooks")
  #   @list.append("Henderson")
  #   @list.prepend("McKinney")
  #   @list.insert(1, "Lawson")
  #
  #   expect(@list.includes?("Brooks")).to eq(true)
  #   expect(@list.includes?("Chapman")).to eq(false)
  #   expect(@list.includes?("Henderson")).to eq(true)
  #   expect(@list.includes?("McKinney")).to eq(true)
  #   expect(@list.includes?("Lawson")).to eq(true)
  # end
  #
  # it 'can find pop elements from the list' do
  #   @list.append("Brooks")
  #   @list.append("Henderson")
  #   @list.prepend("McKinney")
  #   @list.insert(1, "Lawson")
  #
  #   expect{@list.pop}.to output("The Henderson family has died of dysentery").to_stdout
  #   expect{@list.pop}.to output("The Brooks family has died of dysentery").to_stdout
  #   expect(@list.to_string).to eq("The McKinney family, followed by the Lawson family")
  # end

end
