#include<stdio.h>

//import the two funcs from the asm Code
extern int getDivisorCountWithWhileLoop(unsigned int value);
extern void getDivisorCountWithForLoop(int value, int *result);

int main(){
	long long int eingabe;
	int zeiger=0;
	int *result=&zeiger;
	
	printf("Bitte geben Sie die Eingabe !\n");
	scanf("%llu", &num);
	// ueberpruefe der Eingabe 
	if(eingabe>=0){
		
		getDivisorCountWithForLoop(eingabe, result);
		printf("Das Ergebnis mit For Schleife = %d \n",*result);
		int ergebnis= getDivisorCountWithWhileLoop(eingabe);
		rintf("Das Ergebnis mit While Schleife = %d \n",ergebnis);
		
	}else if (eingabe > 2147483647){
		printf("Fehler, falsche Eingabe ,,out of range,,\n");
	}else{
		printf("Fehler, falsche Eingabe in negative \n");
	}
	

return 0;
}
