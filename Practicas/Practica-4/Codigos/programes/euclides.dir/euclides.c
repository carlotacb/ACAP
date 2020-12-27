unsigned int a = 1071, b = 462;
unsigned int mcd;

void main()
{
	while (a != b)
	{
		if (a > b) 
			a = a - b;
		else
			b = b - a;
	}
	mcd = a;
}
