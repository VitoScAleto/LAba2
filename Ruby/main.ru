def zadanie3_21
  puts "Введите количество чисел для ввода:"
  size = gets.chomp.to_i
  number = []
  size.times do |i|
    puts "Введите #{i + 1} число:"
    input_number = gets.chomp.to_i
    number << input_number
  end
  size.times do |i|
    if number[i] >= 0
      a = number[i]
      sum_val = 0
      mult = 1
      while a > 0
        b = a % 10
        sum_val += b
        mult *= b
        a /= 10
      end
      puts "Index number = #{i}" if sum_val < mult
    end
  end
end

def zadanie1_1
  loop do
    counter_null = 1
    puts "Input string:"
    s = gets.chomp
    (s.length).times do |i|
      if s[i] == '0' && s[i + 1] == '0'
        counter_null += 1
      end
      if i < s.length && s[i + 1] == '1' && s[i] == '0'
        if i - counter_null >= 0 && s[i - counter_null] == '1' && s[i - counter_null + 1] == '0'
          puts s[i - counter_null, counter_null + 2]
          counter_null = 1
        end
      end
    end
  end
end

def zadanie2_1
  roman_numeral = { 1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M", 10000 => "Q" }
  roman_numeral_reverse = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000, "Q" => 10000 }
  puts "(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number:"
  number = gets.chomp
  if !is_valid_roman_numeral(number, roman_numeral, roman_numeral_reverse)
    puts "Error roman number"
  elsif is_valid_roman_numeral(number, roman_numeral, roman_numeral_reverse)
    puts "Arabian number = #{translation(number, roman_numeral_reverse)}"
  end
end

def is_valid_roman_numeral(roman_number, roman_numeral, roman_numeral_reverse)
  counter_for_two = 0
  roman_number.each_char.with_index do |char, i|
    is_valid_counter = 0
    roman_numeral.each_value do |value|
      if char == value
        is_valid_counter += 1
        break
      end
    end
    return false if is_valid_counter.zero?

    if i < roman_number.length - 1
      if (char == roman_numeral[5] && roman_number[i + 1] == roman_numeral[5]) ||
         (char == roman_numeral[50] && roman_number[i + 1] == roman_numeral[50]) ||
         (char == roman_numeral[500] && roman_number[i + 1] == roman_numeral[500])
        counter_for_two += 1
      end
      return false if counter_for_two.positive?

      repeat_count_three_times = 0
      roman_number.each_char do |c|
        if char == c
          repeat_count_three_times += 1
        else
          break
        end
      end
      return false if repeat_count_three_times > 3
    end
  end
  true
end

def translation(roman_number, roman_numeral_reverse)
  total = 0
  prev_value = 0
  (roman_number.length - 1).downto(0) do |i|
    value = roman_numeral_reverse[roman_number[i]]
    if value < prev_value
      total -= value
    else
      total += value
    end
    prev_value = value
  end
  total
end

loop do
  puts "Input Zadanie number"
  puts "1 - Zadanie1_1"
  puts "2 - Zadanie2_1"
  puts "3 - Zadanie3_21"
  print "Enter number: "
  choice = gets.chomp
  case choice
  when '3'
    zadanie3_21
  when '2'
    zadanie2_1
  when '1'
    zadanie1_1
  else
    puts "Error"
  end
end

  