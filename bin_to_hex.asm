%include "io.mac"

section .text
    global bin_to_hex
    extern printf

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY
    ;; TODO: Implement bin to hex
    xor eax, eax
    xor ebx, ebx
    mov eax, 3
    add eax, ecx
    mov ebx, 4
    div bl
    mov ah, 0
    mov byte [edx + eax], 0x0a
    push eax
    xor eax, eax
    xor ebx, ebx
    do:
    mov al, byte [esi + ecx - 1]
    sub al, '0'
    add ebx, eax
    xor eax,eax
    dec ecx
    cmp ecx, 0
    je find
    mov al, byte [esi + ecx - 1]
    sub al, '0'
    shl al, 1
    add ebx, eax
    xor eax, eax
    dec ecx
    cmp ecx, 0
    je find
    mov al, byte [esi + ecx - 1]
    sub al, '0'
    shl al, 2
    add ebx, eax
    xor eax, eax
    dec ecx
    cmp ecx, 0
    je find
    mov al, byte [esi + ecx - 1]
    sub al, '0'
    shl al, 3
    add ebx, eax
    dec ecx
    cmp ecx, 0
    je find
    find:
    mov eax, ebx
    cmp eax, 15
    je addF

    mov eax, ebx
    cmp eax, 14
    je addE

    mov eax, ebx
    cmp eax, 13
    je addD

    mov eax, ebx
    cmp eax, 12
    je addC

    mov eax, ebx
    cmp eax, 11
    je addB

    mov eax, ebx
    cmp eax, 10
    je addA

    mov eax, ebx
    cmp eax, 9
    jz add9

    mov eax, ebx
    cmp eax, 8
    je add8

    mov eax, ebx
    cmp eax, 7
    je add7
    
    mov eax, ebx
    cmp eax, 6
    je add6

    mov eax, ebx
    cmp eax, 5
    je add5

    mov eax, ebx
    cmp eax, 4
    je add4

    mov eax, ebx
    cmp eax, 3
    je add3

    mov eax, ebx
    cmp eax, 2
    je add2

    mov eax, ebx
    cmp eax, 1
    je add1

    mov eax, ebx
    cmp eax, 0
    je add0

    continue:
    xor ebx, ebx
    xor eax, eax
    cmp ecx, 0
    jne do
    jmp end


    addF:
    pop eax
    mov byte [edx + eax - 1], 'F'
    dec eax
    push eax
    jmp continue

    addE:
    pop eax
    mov byte [edx + eax - 1], 'E'
    dec eax
    push eax
    jmp continue

    addD:
    pop eax
    mov byte [edx + eax - 1], 'D'
    dec eax
    push eax
    jmp continue
    
    addC:
    pop eax
    mov byte [edx + eax - 1], 'C'
    dec eax
    push eax
    jmp continue

    addB:
    pop eax
    mov byte [edx + eax - 1], 'B'
    dec eax
    push eax
    jmp continue

    addA:
    pop eax
    mov byte [edx + eax - 1], 'A'
    dec eax
    push eax
    jmp continue
    
    add9:
    pop eax
    mov byte [edx + eax - 1], '9'
    dec eax
    push eax
    jmp continue

    add8:
    pop eax
    mov byte [edx + eax - 1], '8'
    dec eax
    push eax
    jmp continue

    add7:
    pop eax
    mov byte [edx + eax - 1], '7'
    dec eax
    push eax
    jmp continue
        
    add6:
    pop eax
    mov byte [edx + eax - 1], '6'
    dec eax
    push eax
    jmp continue

    add5:
    pop eax
    mov byte [edx + eax - 1], '5'
    dec eax
    push eax
    jmp continue

    add4:
    pop eax
    mov byte [edx + eax -1], '4'
    dec eax
    push eax
    jmp continue

    add3:
    pop eax
    mov byte [edx + eax - 1], '3'
    dec eax
    push eax
    jmp continue

    add2:
    pop eax
    mov byte [edx + eax - 1], '2'
    dec eax
    push eax
    jmp continue

    add1:
    pop eax
    mov byte [edx + eax - 1], '1'
    dec eax
    push eax
    jmp continue  

    add0:
    pop eax
    mov byte [edx + eax - 1], '0'
    dec eax
    push eax
    jmp continue   

    end:
    pop eax
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY