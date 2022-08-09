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
  end 

end
