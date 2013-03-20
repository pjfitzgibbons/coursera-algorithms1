require "rspec"
require 'ch1-quickunion/uf_union'

describe "UFUnion" do
  let(:tinyfile) { 'fixtures/tinyUF.txt' }

  it "should do something" do

    #To change this template use File | Settings | File Templates.
    true.should == true
  end

  it "should initialize internal array" do
    uf = UFUnion.new
    uf.array.length.should eq 10
    uf.array.should eq (0..9).to_a
  end

  describe "union" do
    it "should connect two points" do
      uf = UFUnion.new
      uf.union(0,1)
      uf.array[0].should equal uf.array[1]
      uf.array[0].should equal 1
    end
    it "should connect 3 points" do
      uf = UFUnion.new
      uf.union(0,1)
      uf.union(1,2)
      uf.array[0..2].should eq [2,2,2]
    end
  end
end