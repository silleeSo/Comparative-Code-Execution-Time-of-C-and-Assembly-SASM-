section .text
bits 64
default rel
global calculateDotProduct
extern printf

calculateDotProduct:
    push rbp
    mov rbp, rsp
    add rbp, 16
    xorpd xmm0, xmm0             ; Clear xmm0 (dotProduct)
    mov rcx, rdi                  ; Load vector1 pointer to RCX
    mov rdx, rsi                  ; Load vector2 pointer to RDX
    mov r8, rdx                   ; Load size to R8
    shl r8, 3                     ; Multiply size by 8 (sizeof(double))
    add r8, rcx                   ; Calculate end address of vector1
loop_start:
    cmp rcx, r8                   ; Compare current address with end address
    je loop_end                   ; If equal, exit loop
    movsd xmm1, QWORD [rcx]      ; Load double from vector1 to xmm1
    movsd xmm2, QWORD [rdx]      ; Load double from vector2 to xmm2
    mulsd xmm1, xmm2              ; Multiply vector1 element with vector2 element
    addsd xmm0, xmm1              ; Add the result to dotProduct
    add rcx, 8                   ; Move to next element in vector1
    add rdx, 8                   ; Move to next element in vector2
    jmp loop_start                ; Repeat the loop
loop_end:
    pop rbp
    ret
