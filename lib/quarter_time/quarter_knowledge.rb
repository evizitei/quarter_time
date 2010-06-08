module QuarterTime
  module QuarterKnowledge
    def quarter
      month_number = self.month
      while((month_number % 3) != 0) do
         month_number += 1
      end
      quarter = month_number/3
    end
  end
end