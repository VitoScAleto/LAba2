using System;
using System.Collections.Generic;

namespace ConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Input Zadanie number");
                Console.WriteLine("1 - Zadanie1_1");
                Console.WriteLine("2 - Zadanie2_1");
                Console.WriteLine("3 - Zadanie3_21");
                Console.Write("Enter number: ");
                char s = Console.ReadKey().KeyChar;
                Console.WriteLine();
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
            }
        }

        static void Zadanie1_1()
        {
            List<int> number = new List<int> { 76, 24, 614, 14, 1153 };
            int a = 0, b = 0, sum = 0, mult = 1;
            for (int i = 0; i < number.Count; i++)
            {
                if (number[i] < 0) break;
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

        static void Zadanie3_21()
        {
            while (true)
            {
                int counterNull = 1;
                string S;
                Console.WriteLine("Enter the string:");
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
            }
        }

        static void Zadanie2_1()
        {
            Dictionary<int, string> RomanNumeral = new Dictionary<int, string>
            {
                { 1, "I" },
                { 5, "V" },
                { 10, "X" },
                { 50, "L" },
                { 100, "C" },
                { 500, "D" },
                { 1000, "M" },
                { 10000, "Q" }
            };
            Dictionary<string, int> RomanNumeralReverse = new Dictionary<string, int>
            {
                { "I", 1 },
                { "V", 5 },
                { "X", 10 },
                { "L", 50 },
                { "C", 100 },
                { "D", 500 },
                { "M", 1000 },
                { "Q", 10000 }
            };
            string number;
            while (true)
            {
                do
                {
                    Console.WriteLine("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)");
                    Console.Write("Enter roman number: ");
                    number = Console.ReadLine();
                    if (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse))
                    {
                        Console.WriteLine("Error roman number");
                    }
                } while (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse));
                Console.WriteLine("Arabian number = " + translation(number, RomanNumeralReverse));
            }
        }

        static bool isValidRomanNumeral(string romanNumber, Dictionary<int, string> RomanNumeral, Dictionary<string, int> RomanNumeralReverse)
        {
            int counterForTwo = 0;
            for (int i = 0; i < romanNumber.Length; i++)
            {
                int isValidCounter = 0;
                foreach (var item in RomanNumeral)
                {
                    if (romanNumber.Substring(i, 1) == item.Value)
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
}