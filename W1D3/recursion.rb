def sum_to(n)
  return nil if n < 1
  return n if n == 1
  n + sum_to(n - 1)
end

def add_numbers(arr)
  return nil if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return false if flavors.length == 1 && flavors[0] != favorite
  flavors[0] == favorite || ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return "" if string.empty?
  return string if string.length == 1
  string[-1] + reverse(string[0..-2])
end
