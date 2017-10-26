
void foo(double * a, double *b, int size )
{
	int x = 5;

    for(int i = 0; i < size - 2; i++)
	{
        a[i] = a[i+1] + b[i+2] + x;
        a[i] = a[i+1] * b[i+2];
        a[i] = a[i+1] - b[i+2] + x;
        a[i] = a[i+1] / b[i+2];
    }
	

}

int main()
{ 
	double x[] = {1.0,2.0,3.0,4.0,5.0};
	double y[] = {6.0,7.0,8.0,9.0,10.0};
	foo(x, y, 10);
	
	return 0;  //main return 
} 
