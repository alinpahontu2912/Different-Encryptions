%include "io.mac"

section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len
    ;; DO NOT MODIFY


    ;; TODO: Implement the Vigenere cipher
    xor ebx, ebx;
    xor eax, eax;
    xor ecx, ecx;
    mov byte[edx], 0
    mov ebx, edi;
    move:
    mov al, [esi]
    mov ah, al
    cmp ah, 'A'
    jb continue
    mov ah, al
    cmp ah, 'z'
    ja continue
    mov ah, al
    cmp ah, 'Z'
    ja compare
    continue2:
    mov ch, [edi]
    sub ch, 'A'
    inc edi
    cmp byte [edi], 0x00
    je restart
    continue3:
    incr:
    mov ah, al
    cmp ch, 0
    je continue
    cmp ah, 'Z'
    je change_1
    mov ah, al
    cmp ah, 'z'
    je change_2
    continue4:
    inc al
    dec ch
    cmp ch, 0
    jne incr
    continue:
    inc esi
    mov ah, 0
    mov [edx], al
    inc edx
    xor eax, eax
    cmp byte [esi], 0x00
    je end
    jne move
   
    restart:
    mov edi, ebx
    jmp continue3


    compare:
    mov ah, al
    cmp ah, '`'
    jb continue
    jae continue2

    change_1:
    mov al, 'A'
    dec ch
    jmp incr

    change_2:
    mov al, 'a'
    dec ch
    jmp incr

    end:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY