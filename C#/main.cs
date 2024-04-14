using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        do
        {
            Console.WriteLine("Input Zadanie number");
            Console.WriteLine("1 - Zadanie1_1");
            Console.WriteLine("2 - Zadanie2_1");
            Console.WriteLine("3 - Zadanie3_21");
            Console.Write("Enter number: ");
            char s = Convert.ToChar(Console.ReadLine());
            switch (s)
            {
                case '3':
                    Zadanie3_21();
                    break;
                case '2':
                    Zadanie2_1();
                    break;
                case '1':
                    Zadanie1_1();
                    break;
                default:
                    Console.WriteLine("Error");
                    break;
            }
        } while (true);
    }

    static void Zadanie1_1()
    {
        int size = 0;
        int inputNumber = 0;
        Console.WriteLine("Введите количество чисел для ввода:");
        size = Convert.ToInt32(Console.ReadLine());
        List<int> number = new List<int>(size);
        for (int i = 0; i < size; i++)
        {
            Console.WriteLine("Введите " + (i + 1) + " число:");
            inputNumber = Convert.ToInt32(Console.ReadLine());
            number.Insert(i, inputNumber);
        }
        int a = 0, b = 0, sum = 0, mult = 1;
        for (int i = 0; i < size; i++)
        {
            if (number[i] >= 0)
            {
                a = number[i];
                while (a > 0)
                {
                    b = a % 10;
                    sum = sum + b;
                    mult = mult * b;
                    a = a / 10;
                }

                if (sum < mult) Console.WriteLine("Index number = " + i);
                sum = 0;
                mult = 1;
            }
        }
    }

    static void Zadanie3_21()
    {
        int counterNull = 1;
        string S = "\0";
        while (true)
        {
            S = Console.ReadLine();
            for (int i = 0; i < S.Length; i++)
            {
                if (S.Substring(i, 1) == "0" && S.Substring(i + 1, 1) == "0")
                {
                    counterNull++;
                }
                if (S.Substring(i + 1, 1) == "1" && S.Substring(i, 1) == "0")
                {
                    if (S.Substring(i - counterNull, 1) == "1" && S.Substring(i - counterNull + 1, 1) == "0")
                    {
                        Console.WriteLine(S.Substring(i - counterNull, counterNull + 2));
                        counterNull = 1;
                    }
                }
            }
            Console.WriteLine("Input string:");
        }
    }

    static int Zadanie2_1()
    {
        Dictionary<int, string> RomanNumeral = new Dictionary<int, string>
        {
            {1,"I"},{5,"V"},{10,"X"},{50,"L"},{100,"C"},{500,"D"},{1000,"M"}, {10000,"Q"}
        };
        Dictionary<string, int> RomanNumeralReverse = new Dictionary<string, int>
        {
            {"I",1},{"V",5},{"X",10},{"L",50},{"C",100},{"D",500},{"M",1000},{"Q",10000}
        };
        string number;

        Console.WriteLine("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)");
        Console.WriteLine("Enter roman number:");
        number = Console.ReadLine();
        if (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse))
        {
            Console.WriteLine("Error roman number");
        }
        if (isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse))
        {
            Console.WriteLine("Arabian number = " + translation(number, RomanNumeralReverse));
        }
        return 0;
    }

    static bool isValidRomanNumeral(string romanNumber, Dictionary<int, string> RomanNumeral, Dictionary<string, int> RomanNumeralReverse)
    {
        int counterForTwo = 0;
        for (int i = 0; i < romanNumber.Length; i++)
        {
            int isValidCounter = 0;
            foreach (var pair in RomanNumeral)
            {
                if (romanNumber.Substring(i, 1) == pair.Value)
                {
                    isValidCounter++;
                    break;
                }
            }
            if (isValidCounter == 0) return false;
        }
        for (int i = 0; i < romanNumber.Length; i++)
        {
            if (romanNumber.Substring(i, 1) == RomanNumeral[5] && romanNumber.Substring(i + 1, 1) == RomanNumeral[5])
            {
                counterForTwo++;
            }
            else if (romanNumber.Substring(i, 1) == RomanNumeral[50] && romanNumber.Substring(i + 1, 1) == RomanNumeral[50])
            {
                counterForTwo++;
            }
            else if (romanNumber.Substring(i, 1) == RomanNumeral[500] && romanNumber.Substring(i + 1, 1) == RomanNumeral[500])
            {
                counterForTwo++;
            }
            if (counterForTwo > 0) return false;
            int repeatCountThreeTimes = 0;
            for (int j = 0; j < romanNumber.Length; j++)
            {
                if (romanNumber.Substring(i, 1) == romanNumber.Substring(j, 1)) repeatCountThreeTimes++;
                else break;
            }
            if (repeatCountThreeTimes > 3) return false;
        }
        return true;
    }

    static int translation(string romanNumber, Dictionary<string, int> RomanNumeralReverse)
    {
        int total = 0;
        int prevValue = 0;
        for (int i = romanNumber.Length - 1; i >= 0; i--)
        {
            int value = RomanNumeralReverse[romanNumber.Substring(i, 1)];
            if (value < prevValue)
            {
                total -= value;
            }
            else
            {
                total += value;
            }
            prevValue = value;
        }
        return total;
    }
}