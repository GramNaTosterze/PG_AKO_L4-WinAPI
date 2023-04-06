#include <stdio.h>
#include <Windows.h>

__int64 getRam();
int fib(int k);

int main() {
	
	printf("zad1\n ram: %llu kb", getRam());

	LONGLONG ram;
	GetPhysicallyInstalledSystemMemory(&ram);
	printf("\n ram z c: %llu kb", ram*1024);
	
	printf("\nzad2\n");
	printf("fib(3) = %d\n", fib(3));
	printf("fib(4) = %d\n", fib(4));
	printf("fib(5) = %d\n", fib(5));

	printf("fib(10) = %d\n", fib(10));
	printf("fib(23) = %d", fib(23));

	return 0;
}