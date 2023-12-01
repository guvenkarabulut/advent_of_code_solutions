def trebuchet(words)
  numbers = words.map do |word|
    left_integer = word.each_char.find { |char| char.match?(/\d/) }&.to_i(10) || 0
    right_integer = word.reverse.each_char.find { |char| char.match?(/\d/) }&.to_i(10) || 0
    left_integer * 10 + right_integer
  end
  numbers.sum
end
case_inputs = File.readlines("day_1_case_inputs.txt", chomp: true)
puts trebuchet(case_inputs)
