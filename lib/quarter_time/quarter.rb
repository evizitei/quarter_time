class Quarter
  attr_accessor :year
  attr_accessor :quarter

  def initialize(year,quarter)
    @year = year.to_i
    @quarter = quarter.to_i
  end

  def self.current
    today = Date.today
    Quarter.new(today.year, today.quarter)
  end

  def next
    @next ||= build_next
  end

  def previous
    @previous ||= build_previous
  end

  def start_date
    return @_start_date if @_start_date
    @_start_date = Date.civil(year,(quarter * 3) - 2)
  end

  def end_date
    return @_end_date if @_end_date
    @_end_date = Date.civil(year,(quarter*3),-1)
  end

  def yq_hash
    {:year=>self.year,:quarter=>self.quarter}
  end

  def date_hash
    {:start_date=>self.start_date,:end_date=>self.end_date}
  end

  def date_strings_hash
    {:start_date=>self.start_date.strftime("%m/%d/%Y"),:end_date=>self.end_date.strftime("%m/%d/%Y")}
  end

  def quarter_stamp
    "Q#{self.quarter}, #{self.year}"
  end

  def eql?(other_quarter)
    other_quarter.class.eql?(self.class) and other_quarter.year == year and other_quarter.quarter == self.quarter
  end

  alias_method :==,:eql?

protected
  def build_next
    if @quarter < 4
      Quarter.new(@year,@quarter + 1)
    else
      Quarter.new(@year + 1,1)
    end
  end

  def build_previous
    if @quarter > 1
      Quarter.new(@year,@quarter - 1)
    else
      Quarter.new(@year - 1,4)
    end
  end
end
