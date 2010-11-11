module QuarterTime
  module QuarterDriven
    def self.included(base)
      version = ActiveSupport::VERSION::MAJOR
      scope_method = "named_scope" if version.to_i < 3
      scope_method = "scope" if version.to_i >= 3
       
      base.class_eval %Q{
        #{scope_method} :for_quarter, lambda {|*args|
          quarter_obj = (args[0].is_a?(Quarter) ? args[0] : Quarter.new(args[0],args[1]))
          {:conditions=>{:year=>quarter_obj.year, :quarter=>quarter_obj.quarter}}
        }
          
   
        [:start_date,:end_date,:quarter_stamp].each do |delegated_method|
          define_method(delegated_method){ self.quarter_obj.send(delegated_method) }
        end
      }
    end
    #   
    def quarter_obj
      @quarter_obj ||= Quarter.new(self.year,self.quarter)
    end
  end
end
