if RUBY_VERSION >= '1.9'
  require 'time'
  require 'date'
  require 'active_support/time'
else
  require 'active_support'
  require 'active_support/core_ext'
end

require 'active_support/version'
require 'quarter_time/quarter_knowledge'
require 'extensions/date_extension'
require 'extensions/time_extension'
require 'quarter_time/quarter'
require 'quarter_time/quarter_driven'
