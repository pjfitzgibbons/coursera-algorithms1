require "rspec"
$: << 'lib/union_find'
require 'uf_weighted'

# Union-Find with Weighted Union and Path Compression
describe "UFWeighted" do
  let(:uf) { UFWeighted.new(5) }

  it "should do something" do

    #To change this template use File | Settings | File Templates.
    true.should == true
  end

  it "should initialize internal array" do
    uf.array.length.should eq 5
    uf.array.should eq (0..4).to_a
  end

  describe "root" do
    it "should be identity" do
      uf.root(0).should == 0
    end
    it "should find parent" do
      uf.union(0,1)
      uf.root(1).should == 0
    end
    it "should find grandparent" do
      uf.union(0,1)
      uf.union(0,2)
      uf.union(0,3)
      uf.root(3).should == 0
    end
  end

  describe "size" do
    it "should have identity 1" do
      uf.size[0].should == 1
    end
    it "should increment on union" do
      uf.union(0,1)
      uf.size[0].should == 2
      uf.size[1].should == 1
    end
    it "should follow complex graph unions" do
      uf = UFWeighted.new(10)
      uf.union(4, 3)
      uf.union(3, 8)
      uf.union(6, 5)
      uf.union(9, 4)
      uf.union(0, 1)
      uf.union(0, 1)
      uf.union(0, 1)
      uf.union(0, 1)
    end
  end

  describe "connected" do
    it "should find similar roots" do
      uf.union(0, 1)
      uf.union(1, 2)
      uf.connected(0,2).should be_true
    end
  end

  describe "union" do
    it "should connect two points" do
      uf.union(0, 1)
      uf.array[0].should == 0
      uf.array[1].should == 0
    end
    it "should connect 3 points" do
      uf.union(0, 1)
      uf.union(1, 2)
      uf.array[0..2].should eq [0, 0, 0]
    end
    it "should count the connected objects" do
      uf.union(0, 1)
      uf.union(0, 2)
      uf.union(3, 4)
      uf.count.should == 2
    end
    it "should not under count" do
      uf.union(0, 1)
      uf.union(0, 2)
      uf.union(0, 2)
      uf.union(3, 4)
      uf.union(3, 4)
      uf.count.should == 2
    end
  end
end