require 'helper'

class TestTimeExtension < Test::Unit::TestCase
  context "Time" do
    should "know what quarter it is in March" do
      assert_equal 1,Time.local(2010,3,15,9,30).quarter
    end
    
    should "know what quarter it is in November" do
      assert_equal 4,Time.local(2010,11,15,16,45).quarter
    end
  end
end