require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/node'
require 'pry'

RSpec.describe Node do
  it 'should be an instance of an object' do
    node = Node.new("Burke")

    expect(node).to be_a Node
  end
end 
