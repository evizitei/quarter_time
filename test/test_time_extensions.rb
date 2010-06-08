require 'helper'

class TestTimeExtension < Test::Unit::TestCase
  context "Time" do
    should "know what quarter it is in March" do
      assert_equal 1,Time.parse("03/15/2010 9:30 AM").quarter
    end
    
    should "know what quarter it is in November" do
      assert_equal 4,Time.parse("11/15/2010 4:45 PM").quarter
    end
  end
  
end