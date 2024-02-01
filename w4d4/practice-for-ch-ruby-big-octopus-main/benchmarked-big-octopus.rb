require_relative 'big-octopus'
require 'benchmark'
require 'securerandom'


def performance_test(size, count)
  arrays_to_test = Array.new(count) {random_arr(size)}
  Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT, "Avg. clever:", "Avg. dominant:") do |b|
    clever = b.report("Tot. clever: ") { run_clever_octopus(arrays_to_test)}
    dominant = b.report("Tot. dominant: ") { run_dominant_octopus(arrays_to_test)}
    [clever/count, dominant/count]
  end
end

def random_arr(n)
  Array.new(n) {SecureRandom.alphanumeric(rand(10))}
end

def run_clever_octopus(arrays)
  arrays.each do |array|
    array_to_test = array.dup
    clever_octopus(array_to_test)
  end
end

def run_dominant_octopus(arrays)
  arrays.each do |array|
    array_to_test = array.dup
    dominant_octopus(array_to_test)[-1]
  end
end

def run_performance_tests(multiplier = 5, rounds = 3)
  [1, 10, 100, 1000, 10000].each do |size|
    size *= multiplier
    performance_test(size, rounds)
  end
end

p run_performance_tests
