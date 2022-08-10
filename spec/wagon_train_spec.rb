require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/wagon_train'
require 'pry'

RSpec.describe WagonTrain do

  it 'is an instance of an object' do
     wt = WagonTrain.new

     expect(wt).to be_a WagonTrain
  end

  it 'initializes with a linkedlist' do
    wt = WagonTrain.new

    expect(wt.list).to be_a LinkedList
    expect(wt.list.head).to eq(nil)
  end

  it 'can append a node' do
    wt = WagonTrain.new

    expect(wt.append("Burke", {"pounds of food" => 200})).to be_a Node
    expect(wt.list.head.surname).to eq("Burke")
    expect(wt.list.head.supplies).to eq({"pounds of food" => 200})
  end

  it 'can append a second node' do
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})

    expect(wt.append("West", {"pounds of food" => 300})).to be_a Node
    expect(wt.count).to eq(2)
  end

  it 'can prepend a node' do
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})

    expect(wt.list.prepend("Hardy", {"spare wagon tongues" => 3})).to be_a Node
    expect(wt.list.head.surname).to eq("Hardy")
    expect(wt.list.head.supplies).to eq({"spare wagon tongues" => 3})
    expect(wt.count).to eq(2)
  end

  it 'can insert a node' do
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})

    expect(wt.list.insert(1, "West", {"pounds of food" => 300})).to be_a Node
    expect(wt.count).to eq(3)
  end

  it 'can list all supplies' do
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    wt.list.insert(1, "West", {"pounds of food" => 300})

    expect(wt.supplies).to eq({"spare wagon tongues" => 3, "pounds of food" => 500})
  end

  it 'can list multiple supplies' do
    wt = WagonTrain.new
    wt.append("Burke", {"pounds of food" => 200})
    wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
    wt.list.insert(1, "West", {"pounds of food" => 300})
    wt.list.append("Brooks", {"spare wagon tongues" => 12})
    wt.list.append("Henderson", {"pounds of food" => 300})
    wt.list.append("Rhodes", {"Medicine" => 100})

    expect(wt.supplies).to eq({"Medicine"=>100, "pounds of food"=>800, "spare wagon tongues"=>15})
  end

end
