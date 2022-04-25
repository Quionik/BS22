#include<stdio.h>

int main(){
int zahl;
int  a =2;
int  *b;
b=&a;
printf("a mitt & = %d \n ",&a);
printf("a mitt * = %d \n ",a);
printf("b mitt * = %d \n ",*b);
printf("b mitt  = %d \n ",b);
printf("b mitt & = %d \n ",&b);
printf("Hello Worl \n");
scanf("%d",&zahl);
printf("Das ist die Zahl :%d",zahl);
return 0;
}
