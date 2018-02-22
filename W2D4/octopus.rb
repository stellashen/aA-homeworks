=begin
Find the longest fish in the array
arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
        'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
=end

# O(n^2) bubble sort
def sluggish_octopus(arr)
  bubble_sort(arr).last
end

def bubble_sort(arr)
  result = arr.dup
  sorted = false

  until sorted
    i = 0
    sorted = true
    while i < arr.length
      j = i + 1
      while j < arr.length
        if result[i].length > result[j].length
          result[i], result[j] = result[j], result[i]
          sorted = true
        end
        j += 1
      end
      i += 1
    end
  end

  result
end

# O(n log n) merge sort
def dominant_octopus(arr)
  merge_sort(arr).last
end

def merge_sort(arr)
  return arr if arr.length == 1
  mid = arr.length / 2
  left_arr = merge_sort(arr.take(mid))
  right_arr = merge_sort(arr.drop(mid))
  merge(left_arr, right_arr)
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    l = left.first.length
    r = right.first.length
    if l < r
      result << left.shift
    else
      result << right.shift
    end
  end
  result.concat(left).concat(right)
end

# O(n)
def clever_octopus(arr)
  max_length = 0
  max_idx = 0
  i = 0
  while i < arr.length
    cur = arr[i].length
    if cur > max_length
      max_length = cur
      max_idx = i
    end
    i += 1
  end
  arr[max_idx]
end
