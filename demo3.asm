
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

pToAbsolut:
    sub esp,4
    pushad
    push ebp
    mov ebp,esp
    mov ebx,[ebp+40]
    push ebx
    call func_absolut
    add esp,4
    mov [ebp+36],eax
    popad
    mov ebx,[esp]
    add esp,4
    jmp ebx 

pToRelative:       

    sub esp,4
    pushad
    push ebp
    mov ebp,esp
    mov ebx,[ebp+40]
    push ebx
    call func_relative
    add esp,4
    mov [ebp+36],eax
    popad
    mov ebx,[esp]
    add esp,4
    jmp DWORD PTR DS:[ebx] 

func_absolut:

    push ebp
    mov ebp,esp
    mov ebx,[ebp+8]
    sub ebx, 5
                        ; adding fucntion to sending to out blackbox
    mov esp,ebp
    pop ebp
    ret
	
    
func_relative:

    push ebp
    mov ebp,esp
    mov ebx,[ebp+8]
    sub ebx, 6
                        ; adding fucntion to sending to out blackbox
    mov esp,ebp
    pop ebp
    ret 

End Main


