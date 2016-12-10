
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
    call func1
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
    call func2
    add esp,4
    mov [ebp+36],eax
    popad
    mov ebx,[esp]
    add esp,4
    jmp DWORD PTR DS:[ebx] 

func1:

    push ebp
    mov ebp,esp
    mov ebx,[ebp+8]
    sub ebx, 5
    cmp ebx,0040E29Bh
    jz jump4

    cmp ebx,0040E2A9h
    jz  jump5

    cmp ebx,0040E2B6h
    jz  jump4   
    
    cmp ebx,0040E2C0h
    jz  jump4

    cmp ebx,0040E2CEh
    jz  jump5

    cmp ebx,0040E2DBh
    jz  jump4

    cmp ebx,0040E2F1h
    jz  jump4
    
    cmp ebx,0040E2F9h
    jz  jump6
    
    mov esp,ebp
    pop ebp
    ret
	
jump4:
    mov eax,004010B5h   ;printf
    mov esp,ebp
    pop ebp
    ret 4

jump5:
    mov eax,00401000h   ;scanf
    mov esp,ebp
    pop ebp
    ret 4

jump6:
    mov eax,0040E0B1h   ;getche
    mov esp,ebp
    pop ebp
    ret 4

    

func2:

    push ebp
    mov ebp,esp
    mov ebx,[ebp+8]
    sub ebx, 6
    cmp ebx,00401009h
    jz  jump1

    cmp ebx,0040101bh
    jz  jump2
    cmp ebx,0040102fh
    jz  jump1       
    cmp ebx,0040103fh
    jz  jump1
    cmp ebx,00401048h
    jz  jump3
    cmp ebx,0040104eh
    jz  jump3
	
jump1:
    mov eax,402000h
    mov esp,ebp
    pop ebp
    ret 4

jump2:
    mov eax,402004h
    mov esp,ebp
    pop ebp
    ret 4

jump3:
    mov eax,402008h
    mov esp,ebp
    pop ebp
    ret 4

End Main


