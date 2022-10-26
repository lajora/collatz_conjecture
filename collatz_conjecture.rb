def collatz(n)
  sequence = []
  while n != 1
    sequence << n
    n = n.even? ? n/2 : n * 3 + 1
  end
  sequence.push(1)
end

def longest_collatz(max)
  current_max_length = 0
  num = 1
  for num in 1..max
    if collatz(num).length > current_max_length
      current_max_length = collatz(num).length
      value = num
    end
    num += 1
    current_max_length
  end
  value
end

collatz(5)
start = Time.now
longest_collatz(500)
longest_collatz(500000)
finish = Time.now

p (finish - start)
