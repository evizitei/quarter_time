require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "quarter_time"
    gem.summary = %Q{ library for measuring time in quarters (three month periods) and interacting with models that are tied to a specific quarter.}
    gem.description = %Q{A simple gem for dealing with quarter logic.  I happen to have a project where half the models in the database recur every three months as part of a "quarter" of the year.  Within the code, we constantly are asking "what quarter is this for?", or "show me all the records for this quarter".  Well, now I need the same power on another application, so say hello to "quarter_time".}
    gem.email = "ethan.vizitei@gmail.com"
    gem.homepage = "http://github.com/evizitei/quarter_time"
    gem.authors = ["evizitei"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :default => :test
