%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher
    xor eax,eax;
    xor ebx,ebx;
    mov ebx, edi;

    do:
    mov edi,ebx;
    mov al, [esi + ecx - 1]
    mov ah, al
    cmp ah, 'Z'
    ja cmp1

    continue2:
    mov ah, al
    cmp ah, 'A'
    jb continue
    mov ah, al
    cmp ah, 'z'
    ja continue
    incr:
    mov ah, al
    cmp ah, 'z'
    je change_1
    mov ah, al
    cmp ah, 'Z'
    je change_2
    continue1:
    cmp edi, 0;
    je continue
    dec edi;
    inc al;
    cmp edi, 0;
    jne incr;
    je continue
    continue:
    mov [edx + ecx -1], al
    loop do
    jmp end


    ;daca litera este 'z'
    change_1: 
    mov al, 'a'
    dec edi
    jmp continue1


    ;daca litera este 'Z'
    change_2:
    mov al, 'A'
    dec edi
    jmp continue1


    ;verific intervalul in care se afla caracterul 
    cmp1:
    mov ah, al
    cmp ah, '`'
    ja continue2
    jmp continue


    ;ma opresc
    end:


    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY