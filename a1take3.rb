def is_prime?(num)
  (2...num).to_a.each do |i|
    return false if num % i == 0
  end
  true
end

def primes(count)
  primes_array = []
  start = 2
  until primes_array.length == count
    primes_array << start if is_prime?(start)
    start += 1
  end
  primes_array
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
 return [1] if num == 1
 facs = factorials_rec(num - 1)
 facs << facs.last * num
end

class Array
  def dups
    dupped_hash = Hash.new{|h, k| h[k] = []}
    self.each_with_index do |el, index|
      dupped_hash[el] << index
    end
    dupped_hash.select {|k, v| v.length > 1}
  end
end

class String
  def symmetric_substrings
    subs_array = []
    (0).upto(self.length - 2) do |i|
      (i + 1).upto(self.length - 1) do |j|
        subs_array << self[i..j] if self[i..j].reverse == self[i..j]
      end
    end
    subs_array
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|num1, num2| num1 <=> num2 }
    return self if self.length < 2
    midpoint = self.length / 2
    left = self[0...midpoint]
    right = self[midpoint..self.length]
    merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  def merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
          merged << left.shift
      when 1 || 0
          merged << right.shift
      end
    end
    merged + left + right
  end
end
original = [5, 4, 3, 2, 1]
original.merge_sort







#
