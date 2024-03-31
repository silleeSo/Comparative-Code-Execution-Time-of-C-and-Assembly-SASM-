section .text
bits 64
default rel
global calculateDotProduct


calculateDotProduct:
   
    ;counter
    mov rbx, 0
    push rbp
    mov rbp, rsp
    add rbp, 16
    xorpd xmm0, xmm0             ; Clear xmm0 (dotProduct)
    mov r8, rdx                   ; Load size to R8
    mov rcx, rdi                  ; Load vector1 pointer to RCX
    mov rdx, rsi                  ; Load vector2 pointer to RDX
    

loop_start:
    cmp rbx, r8                   ; Compare current address with end address
    je loop_end                   ; If equal, exit loop
    movsd xmm1, QWORD [rcx]      ; Load double from vector1 to xmm1
    movsd xmm2, QWORD [rdx]      ; Load double from vector2 to xmm2
    mulsd xmm1, xmm2              ; Multiply vector1 element with vector2 element
    addsd xmm0, xmm1              ; Add the result to dotProduct
    add rcx, 8                   ; Move to next element in vector1
    add rdx, 8    
    INC rbx               ; Move to next element in vector2
    jmp loop_start                ; Repeat the loop
loop_end:
    pop rbp
    xor rax, rax
    ret