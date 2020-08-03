# https://ruby-prof.github.io/#version-1.0 (ruby 2.4+)
# ruby-prof + QCachegrind MEMORY profiling

require 'ruby-prof'
require_relative '../report_generator'

RubyProf.measure_mode = RubyProf::MEMORY

result = RubyProf.profile do
  work('data_medium.txt')
end

printer = RubyProf::CallTreePrinter.new(result)
printer.print(path: 'profiling', profile: 'profile')
