section .text
    bits 64
    default rel

    global getDotProduct
getDotProduct:
    sub rsp, 16                  ; Allocate space for the shadow space (3 parameters * 8 bytes each)
    xorpd xmm0, xmm0             ; Initialize xmm0 to 0.0 for dotProduct
    xor rcx, rcx                 ; Initialize rcx (loop counter) to 0
    jmp check_loop_condition     ; Jump to check loop condition
    
loop_start:
    mov rax, rcx                 ; Move loop counter (i) to rax for indexing
    movsd xmm1, [rdi + 8*rax]    ; Load vector1[i] into xmm1
    movsd xmm2, [rsi + 8*rax]    ; Load vector2[i] into xmm2
    mulsd xmm1, xmm2             ; Multiply vector1[i] with vector2[i]
    addsd xmm0, xmm1             ; Add the result to dotProduct in xmm0
    
    inc rcx                      ; Increment loop counter (i)
    
check_loop_condition:
    cmp rcx, rdx                 ; Compare loop counter (i) with size
    jl loop_start                ; Jump to loop_start if i < size
    
    add rsp, 16                  ; Restore the stack pointer
    ret                          ; Return with dotProduct in xmm0
