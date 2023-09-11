def fibs(num)
  fib_array = []
  fib_array << 0
  fib_array << 1 if num > 0

  k = 2
  while k < num
    fib_array << fib_array[k - 1] + fib_array[k - 2]
    k += 1
  end
  # print "fib_array: #{fib_array}\n"
  return fib_array
end

fibs(8)

def fibs_rec(num)
  if num < 2
    return num
  else
    return fibs_rec(num - 1) + fibs_rec(num - 2)
  end
end

def print_fibs_sequence(num)
  (0...num).each do |i|
    print "#{fibs_rec(i)} "
  end
  print "\n"
end

print_fibs_sequence(8)
