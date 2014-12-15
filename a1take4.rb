def is_prime?(num)
  (2...num).none? { |n| num % n == 0 }
end

def primes(n)
  array = []
  check = 2
  until array.length == n
    array << check if is_prime?(check)
    check += 1
  end
  array
end

primes(4)

def factorials_rec(num)
  return [1] if num == 1
  facs = factorials_rec(num - 1)
  facs << facs.last * num
end

factorials_rec(5)
class Array
  def dups
    hash = Hash.new {|h,k| h[k] = []}
    self.each_with_index { |v, i| hash[v] << i }
    hash.select {|k| hash[k] if hash[k].length > 1 }
  end
end
[1, 3, 0, 3, 1].dups

class String
  def symmetric_substrings
    subs = []
    (0..self.length-2).each do |i|
      (i+1..self.length-1).each do |j|
        subs << self[i..j] if self[i..j].reverse == self[i..j]
      end
    end
    subs
  end
end
"xabax".symmetric_substrings
class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|num1, num2| num1 <=> num2 }
    return self if self.length < 2
    midpoint = self.length / 2
    left = self[0...midpoint]
    right = self[midpoint...self.length]
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

    merged = merged + left + right
  end
end
p [5,4,3,2,1].merge_sort


#
