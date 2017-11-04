$input = gets.chomp.split(',')

N = $input[0].length

$res = ''

def search(lists, number, index, odd_list, even_list)
  if index == N
    $res += '|' unless $res.empty?
    $res += lists[0].join(',') + ',' + lists[1].join(',')
    return
  end

  list = lists[number]

  if index == 0
    if $input[number][index] == 'o'
      odd_list.uniq.each do |n|
        new_odd_list = odd_list.dup
        new_even_list = even_list.dup
        new_odd_list.delete_at(new_odd_list.find_index(n))

        new_lists = [lists[0].dup, lists[1].dup]
        new_lists[number] << n

        if number == 0
          next_number = 1
          next_index = index
        else
          next_number = 0
          next_index = index+1
        end

        search(new_lists, next_number, next_index, new_odd_list, new_even_list)
      end
    else
      even_list.uniq.each do |n|
        new_odd_list = odd_list.dup
        new_even_list = even_list.dup
        new_even_list.delete_at(new_even_list.find_index(n))

        new_lists = [lists[0].dup, lists[1].dup]
        new_lists[number] << n

        if number == 0
          next_number = 1
          next_index = index
        else
          next_number = 0
          next_index = index+1
        end

        search(new_lists, next_number, next_index, new_odd_list, new_even_list)
      end
    end
  elsif 
    last = list[index-1]

    if $input[number][index] == 'o'
      odd_list.uniq.each do |n|
        next if n < last

        new_odd_list = odd_list.dup
        new_even_list = even_list.dup
         new_odd_list.delete_at(new_odd_list.find_index(n))

        new_lists = [lists[0].dup, lists[1].dup]
        new_lists[number] << n

        if number == 0
          next_number = 1
          next_index = index
        else
          next_number = 0
          next_index = index+1
        end

        search(new_lists, next_number, next_index, new_odd_list, new_even_list)
      end
    else
      even_list.uniq.each do |n|
        next if n < last

        new_odd_list = odd_list.dup
        new_even_list = even_list.dup
        new_even_list.delete_at(new_even_list.find_index(n))

        new_lists = [lists[0].dup, lists[1].dup]
        new_lists[number] << n

        if number == 0
          next_number = 1
          next_index = index
        else
          next_number = 0
          next_index = index+1
        end

        search(new_lists, next_number, next_index, new_odd_list, new_even_list)
      end
    end
  end
end

odd_list = ((1..N).select(&:odd?))*2
even_list = ((1..N).select(&:even?))*2

search([[],[]], 0, 0, odd_list, even_list)

puts $res
