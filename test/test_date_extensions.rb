require 'helper'

class TestDateExtension < Test::Unit::TestCase
  context "Date" do
    should "know what quarter it is in March" do
      assert_equal 1,Date.civil(2010,3,15).quarter
    end
    
    should "know what quarter it is in November" do
      assert_equal 4,Date.civil(2010,11,15).quarter
    end
  end
  
end
