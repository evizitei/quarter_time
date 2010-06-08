require 'helper'

class TestDateExtension < Test::Unit::TestCase
  context "Date" do
    should "know what quarter it is in March" do
      assert_equal 1,Date.parse("03/15/2010").quarter
    end
    
    should "know what quarter it is in November" do
      assert_equal 4,Date.parse("11/15/2010").quarter
    end
  end
  
end
