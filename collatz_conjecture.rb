require 'benchmark'

def collatz(num, cache = nil)
  sequence = [num]
  while sequence.last != 1
    n = sequence.last
    if cache && cache.key?(n)
      sequence += cache[n][1..-1]
      break
    end
    n = n.even? ? n / 2 : n * 3 + 1
    sequence << n
  end
  cache[num] = sequence if cache
  sequence
end

def longest_collatz(max, cache = nil)
  current_max_length = 0
  for num in 1..max
    if collatz(num, cache).length > current_max_length
      current_max_length = collatz(num).length
      value = num
    end
    num += 1
  end
  puts "The number #{value} has the longest sequence of #{current_max_length} elements."
end

max = 500_000
cache = {}

# start = Time.now
# longest_collatz(500)
# longest_collatz(500_000)
# finish = Time.now

# p "Runtime is #{(finish - start)} seconds"

Benchmark.bm do |x|
  x.report('without cache:') { longest_collatz(max) }
  x.report('   with cache:') { longest_collatz(max, cache) }
end
