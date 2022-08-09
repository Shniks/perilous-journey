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

    expect(wt.append("Burke")).to be_a Node
    expect(wt.list.head.surname).to eq("Burke")
  end

  it 'can append a second node' do
    wt = WagonTrain.new
    wt.append("Burke")

    expect(wt.append("West")).to be_a Node
    expect(wt.count).to eq(2)
  end

end
