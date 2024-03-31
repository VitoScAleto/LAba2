#include <iostream>
#include <vector>
using namespace std;

int main(void)
{
	vector<int> number = { 76,24,614,14,1153};
	int a = 0, b = 0,sum =0, mult =1;
	for (int i = 0; i < number.size(); i++)
	{
		if (number[i] < 0) break;
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
	return 0;
}