#include <iostream>
#include <string>
#include<map>
#include<vector>
using namespace std;
void Zadanie3_21(void);
bool isValidRomanNumeral(string romanNumber, map <int, string> RomanNumeral, map <string, int> RomanNumeralReverse);// roman numeral check function
int translation(string romanNumber, map <string, int> RomanNumeralReverse);// translation from roman to arabian
int Zadanie2_1(void);
void Zadanie1_1(void);
int main(void)
{
	do
	{
		cout << "Input Zadanie number\n";
		cout << "1 - Zadanie1_1\n";
		cout << "2 - Zadanie2_1\n";
		cout << "3 - Zadanie3_21\n";
		cout << "Enter number: ";
		char s;
		cin >> s;
		switch (s)
		{
		case('3'):
			Zadanie3_21();
			break;
		case ('2'):
			Zadanie2_1();
			break;
		case ('1'):
			Zadanie1_1();
			break;
		default:
			cout << "Error\n";
		}
	} while (true);
	return 0;
}

void Zadanie1_1(void)
{
	vector<int> number = { 76,24,614,14,1153 };
	int a = 0, b = 0, sum = 0, mult = 1;
	for (int i = 0; i < number.size(); i++)
	{
		if (number[i] > 0)
		{
			a = number[i];
			while (a > 0)
			{
				b = a % 10;// остаток от деления 
				sum = sum + b;//сумма
				mult = mult * b;//умножение
				a = a / 10;// целочисленное деление
			}

			if (sum < mult) cout << "Index number = " << i << endl;//вывод индекса элемента
			sum = 0;
			mult = 1;
		}
	}
}
void Zadanie3_21(void)
{
		int counterNull = 1;
		string S = "\0";
		while (true)
		{
			getline(cin, S);// считывание строки до перехода на новою
			for (int i = 0; i < S.size(); i++)
			{
				if (S.substr(i, 1) == "0" && S.substr(i + 1, 1) == "0")
				{
					counterNull++;
				}
				if (S.substr(i + 1, 1) == "1" && S.substr(i, 1) == "0")// если правая единица и слево от нее ноль
				{
					if (S.substr(i - counterNull, 1) == "1" && S.substr(i - counterNull + 1, 1) == "0")// i - counterNull обращение к левой единице
					{
						cout << S.substr(i - counterNull, counterNull + 2) << endl;// вывод подстроки i  - counterNull(левой единица) counterNull + 2(кол-во нулей + две единицы)
						counterNull = 1;
					}

				}
			}
			cout << "Input string:" << endl;
		}
		
}

int Zadanie2_1(void)
{
	map <int, string> RomanNumeral = { {1,"I"},{5,"V"},{10,"X"},{50,"L"},{100,"C"},{500,"D"},{1000,"M"}, {10000,"Q"} };
	map <string, int> RomanNumeralReverse = { {"I",1},{"V",5} ,{"X",10} ,{"L",50} ,{"C",100} ,{"D",500} ,{"M",1000},{"Q",10000} };
	string number;
	
	
		cout << "(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number:" << endl;
		cin >> number;
		if (isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse) == false)
		{
			cout << "Error roman number\n" << endl;
		}
		if (isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse) == true)
		{
			cout << "Arabian number = " << translation(number, RomanNumeralReverse) << endl;
		}
	return 0;
}
bool isValidRomanNumeral(string romanNumber, map <int, string> RomanNumeral, map <string, int> RomanNumeralReverse)
{
	int counterForTwo = 0;
	for (int i = 0; i < romanNumber.size(); i++)// проверка на использование допустимых символов
	{
		int isValidCounter = 0;
		for (int j = 0; j < RomanNumeral.size(); j++)
		{
			if (romanNumber.substr(i, 1) == RomanNumeral[j])
			{
				isValidCounter++;
				break;
			}
		}
		if (isValidCounter == 0) return false;
	}
	for (int i = 0; i < romanNumber.size(); i++)// недопустимое использование (L = 50, D = 500, V = 5) 2 раза и более
	{
		if (romanNumber.substr(i, 1) == RomanNumeral[5] && romanNumber.substr(i + 1, 1) == RomanNumeral[5])
		{
			counterForTwo++;
		}
		else if (romanNumber.substr(i, 1) == RomanNumeral[50] && romanNumber.substr(i + 1, 1) == RomanNumeral[50])
		{
			counterForTwo++;
		}
		else if (romanNumber.substr(i, 1) == RomanNumeral[500] && romanNumber.substr(i + 1, 1) == RomanNumeral[500])
		{
			counterForTwo++;
		}
		if (counterForTwo > 0) return false;
		int repeatCountThreeTimes = 0;
		for (int j = 0; j < romanNumber.size(); j++)
		{
			if (romanNumber.substr(i, 1) == romanNumber.substr(j, 1)) repeatCountThreeTimes++;
			else break;
		}
		if (repeatCountThreeTimes > 3) return false;
	}

	return true;
}
int translation(string romanNumber, map <string, int> RomanNumeralReverse)//перевод числа в арабское
{
	int total = 0;
	int prevValue = 0;
	for (int i = romanNumber.size(); i >= 0; i--)//бегаем по введеному римскому числу
	{
		int value = RomanNumeralReverse[romanNumber.substr(i, 1)];
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