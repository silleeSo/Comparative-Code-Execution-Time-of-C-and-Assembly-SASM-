section .text
    bits 64
    default rel

    global dotProduct
    extern printf

dotProduct:
    xorpd xmm0, xmm0             ; Initialize xmm0 to 0.0 for dotProduct
    xor rcx, rcx                 ; Initialize rcx (loop counter) to 0
    jmp check_loop_condition     ; Jump to check loop condition
    
loop_start:
    mov rax, rcx                 ; Move loop counter (i) to rax for indexing
    movq xmm1, [rdi + 8*rax]     ; Load vector1[i] into xmm1
    movq xmm2, [rsi + 8*rdx]     ; Load vector2[i] into xmm2
    mulsd xmm1, xmm2             ; Multiply vector1[i] with vector2[i]
    addsd xmm0, xmm1             ; Add the result to dotProduct in xmm0
    
    inc rcx                      ; Increment loop counter (i)
    
check_loop_condition:
    cmp rcx, rdx                 ; Compare loop counter (i) with size
    jl loop_start                ; Jump to loop_start if i < size
    
    ret                          ; Return with dotProduct in xmm0

