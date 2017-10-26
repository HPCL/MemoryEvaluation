#include<iostream>
//#include<stdio.h>
void foo(int a)
{
    int s = 10;
	int n = 3;
	int i,j,x;
    for(i = s, j = 1; i < 22 + n; i++)
        for(int p = 1; p <= j; p++)
			for(x=n; x < 10 + n; x ++)
    {
        a++;
    }

	for(i=1; i < 10; i++){
		a = a + 1;
        a = a - 1;
        a = a * 2;
		for(j=1; j < 10; j++){
		a = a + 1;
		}
	}
}

void bar()
{
	for(int i = 1; i < 10; i++){
		foo(i);
	}

	foo(2);

}

int main()
{ 
  bar();
  return 0;  //main return 
} 
