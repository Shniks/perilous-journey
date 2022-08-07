require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/node'

RSpec.describe Node do
  it 'should be an instance of an object' do
    node = Node.new("Burke")

    expect(node).to be_a Node
  end

  it 'should be have attributes' do
    node = Node.new("Burke")

    expect(node.surname).to eq("Burke")
    expect(node.next_node).to be nil
  end

end
