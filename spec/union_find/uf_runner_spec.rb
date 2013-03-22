require "rspec"
require 'union_find/uf'
require 'union_find/uf_runner'

describe "UFRunner" do
  let(:tinyfile) { 'fixtures/tinyUF.txt' }

  xit "should do something" do

    #To change this template use File | Settings | File Templates.
    true.should == true
  end

  xit "should initialize UF with first value" do
    UF.should_receive(:new).with(10) { uf = mock(:uf, :union => true) }
    runner = UFRunner.new(tinyfile)
  end

  xit "should call UF.union n.times"  do

    UF.any_instance.should_receive(:union).exactly(11).times
    runner = UFRunner.new(tinyfile)
  end
end