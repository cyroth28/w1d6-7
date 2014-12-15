def sum_recur(array)
return 0 if array.length == 0
sum_recur(array[0...-1]) + array.last
end

def includes?(array, value)
  return false if array.empty?
  return true if array.last == value
  includes?(array[0...-1], value)
end


def num_occur(array, num)
  return 0 if array.length == 0
  array.last == num ? nums = num_occur(array[0...-1], num) + 1 : num_occur(array[0...-1], num)
end

array = [3,5,3,2,4,3,1,3]

def add_to_twelve?(array)
  return false if array.length < 2
  return true if array[-2] + array[-1] == 12
  add_to_twelve?(array[0...-1])
end

add_to_twelve?([1, 1, 2, 3, 4, 5, 5, 4, 5, 6, 7, 6, 5, 6])

def sorted?(array)
  return true if array.length < 2
  return false if array[-1] < array[-2]
  sorted?(array[0...-1])
end

sorted?([1, 1, 2, 3, 4, 5, 8, 6, 7])

def reverse(num)
  return num if num.to_s.length == 1
  num_array = num.to_s.split('')
  reversed_num = (num_array.last + reverse(num_array[0...-1].join('').to_i).to_s).to_i
end

p reverse(12345)








#
