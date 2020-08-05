require 'rspec-benchmark'
require_relative '../report_generator'

RSpec.configure do |config|
  config.include RSpec::Benchmark::Matchers
end

describe 'Performance' do
  describe 'generate' do
    it 'works under 700 ms for 5000 lines' do
      expect {
        work('data_medium.txt')
      }.to perform_under(700).ms.warmup(2).times.sample(2).times
    end
  end
end

describe 'Memory' do
  describe 'generate' do
    it 'memory usage for 5000 lines' do
      expect(proc {
        work 'data_medium.txt'
        `ps -o rss= -p #{Process.pid}`.to_i / 1024
      }.call).to be < 70
    end
  end
end
