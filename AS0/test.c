#include<stdio.h>
//import the two funcs from the asm Code
extern int getDivisorCountWithWhileLoop(unsigned int value);
extern void getDivisorCountWithForLoop(int value, int *result);

int main(){
	long long int eingabe;
	int zeiger=0;
	int *result=&zeiger;
	
	printf("Bitte geben Sie die Eingabe !\n");
	scanf("%llu", &eingabe);
	// ueberpruefe der Eingabe 
	
		
		getDivisorCountWithForLoop(eingabe, result);
		printf("Das Ergebnis mit For Schleife = %d \n",*result);

		printf("Das Ergebnis mit While Schleife = %d \n",getDivisorCountWithWhileLoop(eingabe));
		
	

return 0;
}
