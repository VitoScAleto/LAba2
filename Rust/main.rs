use std::collections::HashMap;
use std::io::{self, BufRead};

fn zadanie1_1() {
    let mut counter_null = 1;
    loop {
        println!("Input string:");
        let mut s = String::new();
        io::stdin().lock().read_line(&mut s).unwrap();
        for i in 0..s.len() - 1 {
            if &s[i..=i] == "0" && &s[i + 1..=i + 1] == "0" {
                counter_null += 1;
            }
            if i < s.len() - 2 && &s[i + 1..=i + 1] == "1" && &s[i..=i] == "0" {
                if i as isize - counter_null as isize >= 0 && &s[i - counter_null..=i - counter_null + 1] == "10" {
                    println!("{}", &s[i - counter_null..=i - counter_null + counter_null + 1]);
                    counter_null = 1;
                }
            }
        }
    }
}

fn zadanie3_21() {
    let mut size = String::new();
    println!("Введите количество чисел для ввода:");
    io::stdin().read_line(&mut size).expect("Failed to read line");
    let size: usize = size.trim().parse().expect("Please enter a valid number");

    let mut number = Vec::with_capacity(size);
    for i in 0..size {
        let mut input_number = String::new();
        println!("Введите {} число:", i + 1);
        io::stdin().read_line(&mut input_number).expect("Failed to read line");
        let input_number: i32 = input_number.trim().parse().expect("Please enter a valid number");
        number.push(input_number);
    }

    let mut sum = 0;
    let mut mult = 1;
    for (i, &num) in number.iter().enumerate() {
        if num >= 0 {
            let mut a = num;
            while a > 0 {
                let b = a % 10;
                sum += b;
                mult *= b;
                a /= 10;
            }

            if sum < mult {
                println!("Index number = {}", i);
            }
            sum = 0;
            mult = 1;
        }
    }
}

fn main() {
    loop {
        println!("Input Zadanie number");
        println!("1 - Zadanie1_1");
        println!("2 - Zadanie2_1");
        println!("3 - Zadanie3_21");
        println!("Enter number: ");
        let mut s = String::new();
        io::stdin().read_line(&mut s).expect("Failed to read line");
        match s.trim() {
            "3" => zadanie3_21(),
            "2" => zadanie2_1(),
            "1" => zadanie1_1(),
            _ => println!("Error"),
        }
    }
}

fn zadanie2_1() {
    let mut roman_numeral: HashMap<i32, &str> = HashMap::new();
    roman_numeral.insert(1, "I");
    roman_numeral.insert(5, "V");
    roman_numeral.insert(10, "X");
    roman_numeral.insert(50, "L");
    roman_numeral.insert(100, "C");
    roman_numeral.insert(500, "D");
    roman_numeral.insert(1000, "M");
    roman_numeral.insert(10000, "Q");

    let mut roman_numeral_reverse: HashMap<&str, i32> = HashMap::new();
    roman_numeral_reverse.insert("I", 1);
    roman_numeral_reverse.insert("V", 5);
    roman_numeral_reverse.insert("X", 10);
    roman_numeral_reverse.insert("L", 50);
    roman_numeral_reverse.insert("C", 100);
    roman_numeral_reverse.insert("D", 500);
    roman_numeral_reverse.insert("M", 1000);
    roman_numeral_reverse.insert("Q", 10000);

    loop {
        println!("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)");
        print!("Enter roman number: ");
        let mut number = String::new();
        io::stdin().read_line(&mut number).expect("Failed to read line");
        let number = number.trim().to_string();
        
        if !is_valid_roman_numeral(&number, &roman_numeral, &roman_numeral_reverse) {
            println!("Error roman number");
        } else {
            println!("Arabian number = {}", translate_roman_to_arabic(&number, &roman_numeral_reverse));
        }
    }
}

fn is_valid_roman_numeral(roman_number: &String, roman_numeral: &HashMap<i32, &str>, roman_numeral_reverse: &HashMap<&str, i32>) -> bool {
    let mut counter_for_two = 0;
    
    for c in roman_number.chars() {
        if !roman_numeral.values().any(|&x| x == c.to_string()) {
            return false;
        }
    }
    
    for i in 0..roman_number.len() - 1 {
        if &roman_number[i..i+1] == roman_numeral[&5] && &roman_number[i+1..i+2] == roman_numeral[&5] ||
            &roman_number[i..i+1] == roman_numeral[&50] && &roman_number[i+1..i+2] == roman_numeral[&50] ||
            &roman_number[i..i+1] == roman_numeral[&500] && &roman_number[i+1..i+2] == roman_numeral[&500] {
            counter_for_two += 1;
        }
        
        let mut repeat_count_three_times = 0;
        for j in i..roman_number.len() {
            if &roman_number[i..i+1] == &roman_number[j..j+1] {
                repeat_count_three_times += 1;
            } else {
                break;
            }
        }
        
        if repeat_count_three_times > 3 {
            return false;
        }
    }
    
    true
}

fn translate_roman_to_arabic(roman_number: &String, roman_numeral_reverse: &HashMap<&str, i32>) -> i32 {
    let mut total = 0;
    let mut prev_value = 0;
    
    for i in (0..roman_number.len()).rev() {
        let value = *roman_numeral_reverse.get(&&roman_number[i..i+1]).unwrap_or(&0);
        if value < prev_value {
            total -= value;
        } else {
            total += value;
        }
        prev_value = value;
    }
    
    total
}