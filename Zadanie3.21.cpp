#include <iostream>
using namespace std;

int main(void)
{
	string S;
	cin >> S;
	int counter = 0;
	int index1left = 0;
	int index1Rigth = 0;
	for (int i = 0; i < S.size(); i++)
	{
		if (S.substr(i, 1) == "0")
		{
			counter++;// счетчик нулей
		} 
		int index1left = i - counter;// индекс левой единицы
		int index1Rigth = i + 1;// индекс правой единицы
		if (S.substr(index1left, 1) == "1" && S.substr(index1Rigth, 1) == "1" && S.substr(i, 1) == "0")// условие проверки 1[0]1
		{
			cout << S.substr(index1left, counter + 2) << endl;
			counter = 0;
		}
		
	}
	return 0;
}