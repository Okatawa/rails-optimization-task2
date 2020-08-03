# memory_profiler (ruby 2.3.8+)
# allocated - total memory allocated during profiler run
# retained - survived after MemoryProfiler finished

require_relative '../report_generator'
require 'benchmark'
require 'memory_profiler'

report = MemoryProfiler.report do
  work('data_medium.txt')
end
report.pretty_print(scale_bytes: true)
