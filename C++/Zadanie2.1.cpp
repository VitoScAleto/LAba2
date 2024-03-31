#include <iostream>
#include <string>
#include <map>

using namespace std;
bool isValidRomanNumeral(string romanNumber);// roman numeral check function
int translation(string romanNumber);// translation from roman to arabian
map <int, string> RomanNumeral = { {1,"I"},{5,"V"},{10,"X"},{50,"L"},{100,"C"},{500,"D"},{1000,"M"} };
map <string,int> RomanNumeralReverse = { {"I",1},{"V",5} ,{"X",10} ,{"L",50} ,{"C",100} ,{"D",500} ,{"M",1000} };

int main(void)
{
	string number = "\0";
	while (true)
	{
		do
		{
			cout << "(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number:" << endl;
			cin >> number;
			if (isValidRomanNumeral(number) == false)
			{
				cout << "Error roman number\n" << endl;
			}
		} while (isValidRomanNumeral(number) == false);
		cout << "Arabian number = " << translation(number) << endl;
	}

	return 0;
}

bool isValidRomanNumeral(string romanNumber)
{
	int counter = 0;
	for (int i = 0; i < romanNumber.size(); i++)// проверка на использование допустимых символов
	{
		int counter = 0;
		for (int j = 0; j < RomanNumeral.size(); j++)
		{
			if (romanNumber.substr(i, 1) == RomanNumeral[j])
			{
				counter++;
				break;
			}
		}
		if (counter == 0) return false;
	}
	for (int i = 0; i < romanNumber.size(); i++)// недопустимое использование (L = 50, D = 500, V = 5) 2 раза и более
	{
		if (romanNumber.substr(i, 1) == RomanNumeral[5] && romanNumber.substr(i + 1, 1) == RomanNumeral[5])
		{
			counter++;
		}
		else if (romanNumber.substr(i, 1) == RomanNumeral[50] && romanNumber.substr(i + 1, 1) == RomanNumeral[50])
		{
			counter++;
		}
		else if (romanNumber.substr(i, 1) == RomanNumeral[500] && romanNumber.substr(i + 1, 1) == RomanNumeral[500])
		{
			counter++;
		}
		if (counter > 0) return 0;
	}
	for (int i = 0; i < romanNumber.size(); i++)// повторение более 3 раз 
	{
		counter = 0;
		for (int j = 0; j < romanNumber.size(); j++)
		{
			if (romanNumber.substr(i, 1) == romanNumber.substr(j, 1)) counter++;
			else break;
		}
		if (counter > 3) return false;
	}
	return true;
}

int translation(string romanNumber)//перевод числа в арабское
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