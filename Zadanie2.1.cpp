#include <iostream>
#include <string>
#include <vector>
#include <locale.h>
using namespace std;

vector<string> charRomanNumeral = {"I","V","X","L","C","D","M"};
vector<int> numberRomanNumeral = { 1,5,10,50,100,500,1000 };

bool isValidRomanNumeral(string validLineRomanNumeral);// Проверка римского числа

int main(void)
{
	setlocale(LC_ALL, "Rus");
	string lineRomanNumeral;// вводимое римское число
	do
	{
		cout << "Enter Roman numbers:" << endl;
		cin >> lineRomanNumeral;
			
	} while (isValidRomanNumeral(lineRomanNumeral) == false);
	
	return 0;
}
	
bool isValidRomanNumeral(string validLineRomanNumeral)
{
	for (int i = 0; i < validLineRomanNumeral.size(); i++)// Проверка на используемые символы
	{
		int counter = 0;
		for (int j = 0; j < charRomanNumeral.size(); j++)
		{
			if (validLineRomanNumeral.substr(i,1) == charRomanNumeral[j])
			{
				counter++;
				break;
			}
		}
		if (counter == 0)
			return false;
	}
	for (int i = 0; i < validLineRomanNumeral.size(); i++)// Проверка чтобы L V D не повторялись больше 2 раз
	{
		if(validLineRomanNumeral.substr(i,1) == charRomanNumeral[1] 
			
	
	return true;
}

