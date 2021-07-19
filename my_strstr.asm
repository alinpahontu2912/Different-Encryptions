%include "io.mac"

section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr
    xor eax, eax;
    mov edx, ebx
    mov dword [edi],0
    move:
    mov ebx, edx
    mov ah, [esi]
    mov al, [ebx]
    cmp ah, al
    je check_word
    jne continue
    continue:
    sub ebx, edx
    add dword [edi], ebx 
    inc esi
    inc dword [edi]
    cmp byte [esi], 0x00
    jnz move
    jmp end

    check_word:
    inc esi
    inc ebx
    mov ah, [esi]
    mov al, [ebx]
    cmp al, 0x00
    je end2
    mov al, [ebx]
    cmp ah, al
    je check_word
    jne continue

    end: 
    inc ecx
    mov dword [edi], ecx
    end2:

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY