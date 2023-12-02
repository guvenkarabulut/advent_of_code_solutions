$number_words = {
 "one": 1,
 "two": 2,
 "three": 3,
 "four": 4,
 "five": 5,
 "six": 6,
 "seven": 7,
 "eight": 8,
 "nine": 9
}

class String
 def get_first_number_word
  res = nil
  i = length

  $number_words.each do |key, _value|
   key = key.to_s
   if include?(key) && index(key) < i
    i = index(key)
    res = $number_words[key.to_sym]
   end
  end
  str_only_digits = self[0...i].tr('^0-9', '')
  res = str_only_digits[0] unless str_only_digits[0].nil?
  res
 end

 def get_last_number_word
  res = nil
  i = 0

  $number_words.each do |key, _value|
   key = key.to_s
   if include?(key) && rindex(key) >= i
    i = rindex(key)
    res = $number_words[key.to_sym]
   end
  end
  str_only_digits = self[i..-1].tr('^0-9', '')
  res = str_only_digits[-1] unless str_only_digits[0].nil?
  res
 end

 def numeric?
  !Float(self).nil?
 rescue StandardError
  false
 end
end

def trebuchet_part_two(data)
 res = 0
 data.each do |line|
  res += (line.get_first_number_word.to_s + line.get_last_number_word.to_s).to_i
 end
 res
end

 def trebuchet_part_one(words)
  numbers = words.map do |word|
   left_integer = word.each_char.find { |char| char.match?(/\d/) }&.to_i(10) || 0
   right_integer = word.reverse.each_char.find { |char| char.match?(/\d/) }&.to_i(10) || 0
   left_integer * 10 + right_integer
  end
  numbers.sum
 end

 case_inputs = File.readlines('day_1_case_inputs.txt', chomp: true)

 puts "part one #{trebuchet_part_one(case_inputs)}"
 puts "part two #{trebuchet_part_two(case_inputs)}"
