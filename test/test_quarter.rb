require 'helper'

class TestQuarter < Test::Unit::TestCase
  context "Quarter" do
    context '.current' do
      should "return a new quarter object for the current year/quarter" do
        today = Date.today
        quarter = Quarter.current
        assert_equal today.year, quarter.year
        assert_equal today.quarter, quarter.quarter
      end
    end

    context '.next' do
      should 'build a new quarter object for the next quarter when near the begining of the year' do
        begin
          Timecop.travel(Date.civil(2013))
          quarter = Quarter.next
          assert_equal 2013, quarter.year
          assert_equal 2, quarter.quarter
        ensure
          Timecop.return
        end
      end

      should "build a new quarter object for the next quarter when near the end of the year" do
        begin
          Timecop.travel(Date.civil(2013, 12))
          quarter = Quarter.next
          assert_equal 2014, quarter.year
          assert_equal 1, quarter.quarter
        ensure
          Timecop.return
        end
      end
    end

    should "be capable of creation from strings" do
      assert_equal Date.civil(2009,1,1),Quarter.new("2009","1").start_date
    end

    should "calculate start date for first quarter" do
      assert_equal Date.civil(2009,1,1),Quarter.new(2009,1).start_date
    end

    should "calculate start date for second quarter" do
      assert_equal Date.civil(2009,4,1),Quarter.new(2009,2).start_date
    end

    should "calculate start date for third quarter" do
      assert_equal Date.civil(2009,7,1),Quarter.new(2009,3).start_date
    end

    should "calculate start date for fourth quarter" do
      assert_equal Date.civil(2009,10,1),Quarter.new(2009,4).start_date
    end

    should "calculate end date for first quarter" do
      assert_equal Date.civil(2009,3,31),Quarter.new(2009,1).end_date
    end

    should "calculate end date for second quarter" do
      assert_equal Date.civil(2009,6,30),Quarter.new(2009,2).end_date
    end

    should "calculate end date for third quarter" do
      assert_equal Date.civil(2009,9,30),Quarter.new(2009,3).end_date
    end

    should "calculate end date for fourth quarter" do
      assert_equal Date.civil(2009,12,31),Quarter.new(2009,4).end_date
    end

    should "be equal to other quarter made from same year and quarter" do
      assert Quarter.new(2010,3).eql?(Quarter.new(2010,3))
    end

    should "be equal to other quarter made from same year and quarter with double equals as well" do
      assert Quarter.new(2010,3) == Quarter.new(2010,3)
    end
  end

  context "Prebuilt Quarter" do
    setup { @quarter = Quarter.new(2009,4)}

    should "produce a hash for parameters with year and month" do
      assert_equal({:year=>2009,:quarter=>4},@quarter.yq_hash)
    end

    should "produce a hash for parameters with start_date and end_date" do
      assert_equal({:start_date=>Date.civil(2009,10,1),:end_date=>Date.civil(2009,12,31)},@quarter.date_hash)
    end

    should "produce a params hash with strings for dates" do
      assert_equal({:start_date=>"10/01/2009",:end_date=>"12/31/2009"},@quarter.date_strings_hash)
    end
  end
end
