def zadanie3_21
    loop do
      counter_null = 1
      s = gets.chomp
      (0...s.size).each do |i|
        if s[i, 1] == "0" && s[i + 1, 1] == "0"
          counter_null += 1
        end
        if s[i + 1, 1] == "1" && s[i, 1] == "0"
          if s[i - counter_null, 1] == "1" && s[i - counter_null + 1, 1] == "0"
            puts s[i - counter_null, counter_null + 2]
            counter_null = 1
          end
        end
      end
      puts "Enter the string:"
      s = ""
    end
  end
  
  def zadanie1_1
    numbers = [76, 24, 614, 14, 1153]
    numbers.each_with_index do |number, i|
      next if number < 0
      a = number
      sum = 0
      mult = 1
      while a > 0
        b = a % 10
        sum += b
        mult *= b
        a /= 10
      end
      puts "Index number = #{i}" if sum < mult
    end
  end
  
  def main
    loop do
      puts "Input Zadanie number"
      puts "1 - Zadanie1_1"
      puts "2 - Zadanie2_1"
      puts "3 - Zadanie3_21"
      print "Enter number: "
      s = gets.chomp
      case s
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
  end
  
  def zadanie2_1
    roman_numeral = { 1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M", 10000 => "Q" }
    roman_numeral_reverse = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000, "Q" => 10000 }
    loop do
      loop do
        puts "(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)"
        print "Enter roman number: "
        number = gets.chomp
        unless is_valid_roman_numeral(number, roman_numeral, roman_numeral_reverse)
          puts "Error roman number"
        else
          puts "Arabian number = #{translation(number, roman_numeral_reverse)}"
          break
        end
      end
    end
  end
  
  def is_valid_roman_numeral(roman_number, roman_numeral, roman_numeral_reverse)
    counter_for_two = 0
    (0...roman_number.size).each do |i|
      return false unless roman_numeral.value?(roman_number[i, 1])
    end
    (0...roman_number.size).each do |i|
      if roman_number[i, 1] == roman_numeral[5] && roman_number[i + 1, 1] == roman_numeral[5] ||
         roman_number[i, 1] == roman_numeral[50] && roman_number[i + 1, 1] == roman_numeral[50] ||
         roman_number[i, 1] == roman_numeral[500] && roman_number[i + 1, 1] == roman_numeral[500]
        counter_for_two += 1
      end
      repeat_count_three_times = 0
      (0...roman_number.size).each do |j|
        if roman_number[i, 1] == roman_number[j, 1]
          repeat_count_three_times += 1
        else
          break
        end
      end
      return false if repeat_count_three_times > 3
    end
    true
  end
  
  def translation(roman_number, roman_numeral_reverse)
    total = 0
    prev_value = 0
    (roman_number.size - 1).downto(0) do |i|
      value = roman_numeral_reverse[roman_number[i, 1]]
      if value < prev_value
        total -= value
      else
        total += value
      end
      prev_value = value
    end
    total
  end
  
  main
  