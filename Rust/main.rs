use std::collections::HashMap;
use std::io::{self, BufRead};

fn zadanie3_21() {
    loop {
        let mut counter_null = 0;
        let mut s = String::new();
        if let Ok(_) = io::stdin().read_line(&mut s) {
            let s = s.trim();
            for (i, c) in s.chars().enumerate() {
                if c == '0' {
                    counter_null += 1;
                } else if c == '1' && i >= counter_null && s.chars().nth(i - counter_null).unwrap() == '0' {
                    println!("{}", &s[i - counter_null - 1..i + 1]);
                    counter_null = 0;
                } else {
                    counter_null = 0;
                }
            }
        }
        println!("Enter the string:");
    }
}

fn zadanie1_1() {
    let numbers = vec![76, 24, 614, 14, 1153];
    for (i, &number) in numbers.iter().enumerate() {
        if number < 0 {
            continue;
        }
        let mut a = number;
        let mut sum = 0;
        let mut mult = 1;
        while a > 0 {
            let b = a % 10;
            sum += b;
            mult *= b;
            a /= 10;
        }
        if sum < mult {
            println!("Index number = {}", i);
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
    let mut roman_numeral = HashMap::new();
    roman_numeral.insert(1, "I");
    roman_numeral.insert(5, "V");
    roman_numeral.insert(10, "X");
    roman_numeral.insert(50, "L");
    roman_numeral.insert(100, "C");
    roman_numeral.insert(500, "D");
    roman_numeral.insert(1000, "M");
    roman_numeral.insert(10000, "Q");

    let mut roman_numeral_reverse = HashMap::new();
    roman_numeral_reverse.insert("I", 1);
    roman_numeral_reverse.insert("V", 5);
    roman_numeral_reverse.insert("X", 10);
    roman_numeral_reverse.insert("L", 50);
    roman_numeral_reverse.insert("C", 100);
    roman_numeral_reverse.insert("D", 500);
    roman_numeral_reverse.insert("M", 1000);
    roman_numeral_reverse.insert("Q", 10000);

    loop {
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
                break;
            }
        }
    }
}

fn is_valid_roman_numeral(roman_number: &String, roman_numeral: &HashMap<i32, &str>, roman_numeral_reverse: &HashMap<&str, i32>) -> bool {
    let mut counter_for_two = 0;
    for i in 0..roman_number.len() {
        if !roman_numeral.values().any(|&x| x == &roman_number[i..i + 1]) {
            return false;
        }
    }
    for i in 0..roman_number.len() {
        if &roman_number[i..i + 1] == roman_numeral[&5] && &roman_number[i + 1..i + 2] == roman_numeral[&5] ||
            &roman_number[i..i + 1] == roman_numeral[&50] && &roman_number[i + 1..i + 2] == roman_numeral[&50] ||
            &roman_number[i..i + 1] == roman_numeral[&500] && &roman_number[i + 1..i + 2] == roman_numeral[&500] {
            counter_for_two += 1;
        }
        let mut repeat_count_three_times = 0;
        for j in 0..roman_number.len() {
            if &roman_number[i..i + 1] == &roman_number[j..j + 1] {
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
        let value = *roman_numeral_reverse.get(&&roman_number[i..i + 1]).unwrap_or(&0);
        if value < prev_value {
            total -= value;
        } else {
            total += value;
        }
        prev_value = value;
    }
    total
}



fn translation(roman_number: &String, roman_numeral_reverse: &HashMap<&str, i32>) -> i32 {
    let mut total = 0;
    let mut prev_value = 0;
    for i in (0..roman_number.len()).rev() {
        let value = roman_numeral_reverse[&roman_number[i..i+1]].clone();
        if value < prev_value {
            total -= value;
        } else {
            total += value;
        }
        prev_value = value;
    }
    total
}