require 'simplecov'
SimpleCov.start
require './spec/spec_helper'
require './lib/node'

RSpec.describe Node do
  it 'should be an instance of an object' do
    node = Node.new("Burke", {"pounds of food" => 200})

    expect(node).to be_a Node
  end

  it 'should be have attributes' do
    node = Node.new("Burke", {"pounds of food" => 200})

    expect(node.surname).to eq("Burke")
    expect(node.supplies).to eq({"pounds of food" => 200})
    expect(node.next_node).to be nil
  end

end
