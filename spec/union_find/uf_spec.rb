require "rspec"
$: << 'lib/union_find'
require 'uf'


describe "UF" do
  let(:uf) { UF.new(5) }

  it "should do something" do

    #To change this template use File | Settings | File Templates.
    true.should == true
  end

  it "should initialize internal array" do
    uf.array.length.should eq 5
    uf.array.should eq (0..4).to_a
  end

  describe "union" do
    it "should connect two points" do
      uf.union(0,1)
      uf.array[0].should equal uf.array[1]
      uf.array[0].should equal 1
    end
    it "should connect 3 points" do
      uf.union(0,1)
      uf.union(1,2)
      uf.array[0..2].should eq [2,2,2]
    end
  end
end