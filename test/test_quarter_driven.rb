require 'helper'

class TestQuarterDriven < Test::Unit::TestCase
  context "When Included in a class" do
    setup do
      @model = QuarterDrivenModel.new
    end
    
    should "produce quarter object from year and quarter attributes" do
      assert_equal Quarter.new(2010,2),@model.quarter_obj
    end
    
    should "delegate start date to quarter object" do
      assert_equal Date.parse("4/1/2010"),@model.start_date
    end
    
    should "delegate end date to quarter object" do
      assert_equal Date.parse("6/30/2010"),@model.end_date
    end
    
    should "delegate quarter stamp to quarter object" do
      assert_equal "Q2, 2010",@model.quarter_stamp
    end
    
    should "create a named scope to find by a quarter object" do
      expected_map = {:conditions=>{:year=>2010,:quarter=>4}}
      assert_equal expected_map,QuarterDrivenModel.scopes[:for_quarter].call(Quarter.new(2010,4))
    end
  end

end

class QuarterDrivenModel
  attr_accessor :year,:quarter
  
  def self.scopes
    @@scopes
  end
  
  def self.named_scope(name,func = nil)
    @@scopes ||= {}
    @@scopes[name] = func
  end
  
  def initialize(year = 2010,quarter = 2)
    @year = year
    @quarter = quarter
  end

  include QuarterTime::QuarterDriven
end