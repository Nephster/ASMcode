
.386
.model flat, stdcall

include \masm32\include\kernel32.inc
includelib \masm32\lib\kernel32.lib
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib

    
.data   


    
.code
start:
    
Main:


		    push 0                      ;creates space in stack
			pushad                      ;save the state of all registers
			pushfd                      ; save the state of all flags
			push ebp
			mov ebp, esp
			mov ebx, [ebp + 44]         ;pick calling address and save to stack
			sub ebx, 5
			push ebx
			call translateAddrFun		
			add esp, 8
			mov[ebp + 40], eax          ;in stack is saving a pointer to function
			popfd
			popad
			add esp, 4
			jmp DWORD PTR SS : [esp - 4];jump to real function address

			nop

			push 0                      
			pushad                      
			pushfd                      
			push ebp
			mov ebp, esp
			mov ebx, [ebp + 44]         
			sub ebx, 5
			push ebx
			call translateAddrFun		
			add esp, 8
			mov ebx, [eax]
			mov[ebp + 40], ebx          
			popfd
			popad
			add esp, 4
			jmp DWORD PTR SS : [esp - 4]


End Main


