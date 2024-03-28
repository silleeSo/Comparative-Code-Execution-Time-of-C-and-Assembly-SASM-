section .text
    global calculateDotProduct

calculateDotProduct:
    ; Input:
    ;   rdi: pointer to vector1
    ;   rsi: pointer to vector2
    ;   rdx: size (number of elements in the vectors)
    ; Output:
    ;   xmm0: dot product of the vectors

    xorpd   xmm0, xmm0       ; Clear xmm0 (accumulator)

    ; Loop unrolling by processing 2 elements per iteration
    ; for optimization ito, not sure though if we can do it na 11 lines onli
    xor     rcx, rcx         ; Clear rcx (loop counter)
loop_start:
    movapd  xmm1, [rdi + rcx * 8]  ; Load 2 doubles from vector1 to xmm1
    movapd  xmm2, [rsi + rcx * 8]  ; Load 2 doubles from vector2 to xmm2
    mulsd   xmm1, xmm2       ; Multiply 2 doubles pairwise
    addsd   xmm0, xmm1       ; Add the result to accumulator

    ; Increment loop counter by 2 for each iteration
    add     rcx, 2
    cmp     rcx, rdx         ; Compare loop counter with size
    jl      loop_start       ; Jump if not reached end of vectors

    ret
