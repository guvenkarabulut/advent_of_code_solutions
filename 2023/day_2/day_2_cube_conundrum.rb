def check_case(arr)
  @case = {
    'red' => 12,
    'green' => 13,
    'blue' => 14
  }

  arr.each do |item|
    elements = item.split
    (0..elements.length - 1).step(2) do |i|
      count = elements[i]
      color = elements[i + 1].downcase
      return false if @case[color.tr(',', '')].to_i < count.to_i
    end
  end
  true
end

def part_one
  case_inputs = File.readlines('day_2_case_inputs.txt', chomp: true)
  split_game_number_and_ball_size = {}

  case_inputs.each do |line|
    split_game_number_and_ball_size[line.split(':')[0]] = line.split(':')[1]
  end
  sum_array = []
  split_game_number_and_ball_size.each do |_key, _value|
    cases = _value.split(';')
    sum_array.push(_key.tr('Game ', '').to_i) if check_case(cases)
  end

  print sum_array.sum
end

def multiply_greatest_cases(arr)
  greatest_red = 0
  greatest_green = 0
  greatest_blue = 0
  arr.each do |item|
    elements = item.split
    (0..elements.length - 1).step(2) do |i|
      count = elements[i].to_i
      color = elements[i + 1].downcase.tr(',', '')
      case color
      when 'red'
        greatest_red = count if count > greatest_red
      when 'blue'
        greatest_blue = count if count > greatest_blue
      when 'green'
        greatest_green = count if count > greatest_green
      end
    end
  end
  greatest_green * greatest_blue * greatest_red
end

def part_two
  case_inputs = File.readlines('day_2_case_inputs.txt', chomp: true)
  split_ball_sizes = []
  sum_array = []
  case_inputs.each do |line|
    sum_array.push(multiply_greatest_cases(line.split(':')[1].split(';')))
  end

  puts sum_array.sum
end

part_two
