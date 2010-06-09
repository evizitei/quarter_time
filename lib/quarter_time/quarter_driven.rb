module QuarterTime
  module QuarterDriven
    def self.included(base)
      base.class_eval do
        named_scope :for_quarter, lambda{|quarter_obj|{:conditions=>{:year=>quarter_obj.year, :quarter=>quarter_obj.quarter}}}
   
        [:start_date,:end_date,:quarter_stamp].each do |delegated_method|
          define_method(delegated_method){ self.quarter_obj.send(delegated_method) }
        end
      end
    end
    #   
    def quarter_obj
      @quarter_obj ||= Quarter.new(self.year,self.quarter)
    end
  end
end