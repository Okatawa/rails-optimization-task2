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
