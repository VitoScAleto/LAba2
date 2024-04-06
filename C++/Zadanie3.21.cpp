#include <iostream>
#include <string>
using namespace std;

int main(void)
{
	int counterNull = 1;
	string S = "\0";
	getline(cin, S);// считывание строки до перехода
	for (int i = 0; i < S.size(); i++)
	{
		if (S.substr(i, 1) == "0" && S.substr(i + 1, 1) == "0")
		{
			counterNull++;
		}
		if (S.substr(i+1, 1) == "1")// если правая единица
		{
			if (S.substr(i - counterNull, 1) == "1")// i - counterNull обращение к левой единице
			{
				cout << S.substr(i - counterNull, counterNull + 2) << endl;// вывод подстроки i  - counterNull(левой единица) counterNull + 2(кол-во нулей + две единицы)
				counterNull = 1;
			}

		}
	}
	return 0;
}