#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main(void)
{
	int counter1 = 0;
	int cpunter2 = 0;
	int k = 0;
	string S = "101vsjkl100ca1001o1,d";
	//cin >> S;
	vector <int> UnitIndex;
	for (int i = 0; i < S.size(); i++ )// find index unit
	{
		if (S.substr(i, 1) == "1")// find index unit
		{
			UnitIndex.push_back(i);// add index in set
		}
	}
	//for (auto x : UnitIndex)
	//{
	//	cout << x << endl;
	//}
	for (int i = 0; i < UnitIndex.size(); i++)// i = index unit
	{
		int substringLength = UnitIndex[i + 1] - UnitIndex[i] + 1;// substring length 1[0]1
		if (substringLength % 2 == 0)// проверка четности числа
		{
			for (int j = UnitIndex[i + 1], k = i; j < substringLength; j--,k++)
			{
				if (S.substr(k + 1, 1) == "0" && S.substr(j - 1, 1) == "0")
				{
					counter1++;
				}
			}
		}
		k = 0;
		if (counter1 == (substringLength - 2) % 2) cout << S.substr(i, substringLength);
		//if (substringLength % 2 == 1)// проверка четности числа
		//{
		//	for (int j = UnitIndex.count(i + 1); j < substringLength; j--,i++)
		//	{
		//		if (S.substr(i + 1, 1) == "0" && S.substr(j - 1, 1) == "0");
		//		
		//	}
		//}
		

	}
	return 0;
}