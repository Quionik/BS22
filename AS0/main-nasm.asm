;
;	to compile this code
;	first create an object file
;	nasm -f elf -o main.o main-nasm.asm
;
;	to create an executeable, link it
;	gcc -m32 -o run main.o
;
;	run it:
;	./run

global getDivisorCountWithForLoop;
global getDivisorCountWithWhileLoop;

;###########  For Loop  #############
getDivisorCountWithForLoop:
	push ebp							; lege Basispointer auf dem Stack.
	mov ebp esp						; speichere die Adresse von Stackpointer in Basispointer.
	push ebx							; lege register ebx auf dem Stack.
	push 0								; lege 0 als Conter auf dem Stack, um Anzahl ganzzahliger Teiler zu bestimmen
	mov ecx, 1						; definiere Register ecx als Counter, wird. im Luafe des Programm inkr.
	mov ebx, [ebp+8] 			; speichere in ebx den Eingabewert.
	
	cmp ebx,0
	je ende
	jne loop
	
loop:	
	cmp ecx,ebx						; ueberpruefe ob, ebx und ecx gleich sind, dann gehe in Ende
	jne	ende
	mov eax ,ebx					; uebertrage ebx in eax, um die Dividtion durchzufuehren.
	mov edx, 0						; setze edx auf null, um den Rest vom Teilen zu erkennen.
	div ecx								; teile mit ecx
	cmp edx,0							; vergleiche den Rset 
	je keinRest						; mit 0 Rest gehe in keinRest
	jne mitRest						; mehr als 0 gehe in mitRest
	
keinRest:
	pop eax								; hole Counter fuer Anyahl der Teiler aus dem Stack 
	inc eax								; erhoehe es um eins
	push eax							; pusche es wieder auf dem Stack
	inc ecx								; erhoehe ecx um eins
	jmp loop							; gehe wieder in loop
	
mitRest:
	inc ecx								; erhoehe ecx um eins
	jmp loop							; gehe wieder in loop
			
ende:				
	pop eax								; hole Counter aus dem Stack			
	mov ecx, [ebp+12]			; hole die Adresse aus dem Parameter
	mov [ecx], eax				; uebertrage den Counterwert
	pop ebx								; loesche ebx aus dem Stack
	pop ebp				 				; loesche ebp aus dem Satck
	ret
	
	
;###########  While Loop  #############
getDivisorCountWithWhileLoop:
	push ebp							; lege Basispointer auf dem Stack.
	mov ebp esp						; speichere die Adresse von Stackpointer in Basispointer.
	push ebx							; lege register ebx auf dem Stack.
	push 0								; lege 0 als Conter auf dem Stack, um Anzahl ganzzahliger Teiler zu bestimmen
	mov ecx, [ebp+12]			; definiere Register ecx als Counter, wird es im Luafe des Programm dekr.
	mov ebx, [ebp+12] 		; speichere in ebx den Eingabewert.
	
loopBedingung:
	cmp ecx,0							; die Bedingung while(Eingabe==0),wird es im Luafe des Programm dekr.
	je endeWhileLoop			; bende das Programm, wenn ((Eingabe=0)==0)
	jne loopKoerper				; gehe in loop Koerper
	
loopKoerper:	
	mov eax,ebx						; uebertrage ebx in eax, um die Dividtion durchzufuehren.
	mov edx,0							; setze edx auf null, um den Rest vom Teilen zu erkennen.
	div ecx
	cmp edx,0							; vergleiche den Rset 
	je keinRestwhileLoop	; mit 0 Rest gehe in keinRest
	jne mitRestWhileLoop	; mehr als 0 gehe in mitRest
	
keinRestwhileLoop:
	pop eax								; hole Counter fuer Anzahl der Teiler aus dem Stack 
	inc eax								; erhoehe es um eins
	push eax							; lege es wieder auf dem Stack
	dec ecx								; erhoehe ecx um eins
	jmp loopBedingung			; gehe wieder in Loop Bedingung
	
mitRestWhileLoop:
	dec ecx								; erhoehe ecx um eins
	jmp loopBedingung			; gehe wieder in Loop	Bedingung
	
endeWhileLoop:	
	pop eax								; gebe Anzahl ganzzahliger Teiler
	pop ebx								; loesche ebx vom Stack
	pop ebp								; loesche ebp vom Stack
	ret			
	
	
	
	
