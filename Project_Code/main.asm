section .data
    RAND_MAX_DOUBLE dq 4294967296.0  ; Value of RAND_MAX + 1, as a double precision floating point number

section .text
    bits 64
    default rel

    global generateFixedVector
    global generateRandomVector
    global calculateDotProduct

generateFixedVector:
    ; Input:
    ;   rdi: size (number of elements in the array)
    ; Output:
    ;   rax: pointer to the allocated array

    ; Allocate memory for the array
    push    rdi              ; Preserve size
    imul    rdi, rdi, 8      ; Calculate size * sizeof(double)
    call    malloc           ; Allocate memory for the array
    pop     rcx              ; Restore size

    ; Check for allocation success
    cmp     rax, 0           ; Check if rax contains zero (indicating failure)
    je      allocation_failed

    ; Initialize loop counter and store double values in the array
    xor     rsi, rsi         ; Clear loop counter
populate_loop:
    movsd   xmm0, rsi        ; Move loop counter to xmm0
    cvtsi2sd xmm0, xmm0      ; Convert loop counter to double
    movsd   qword [rax + rsi * 8], xmm0  ; Store double value in the array
    inc     rsi              ; Increment loop counter
    cmp     rsi, rcx         ; Compare loop counter with size
    jl      populate_loop    ; Jump if not reached end of array

    ret

allocation_failed:
    ; Handle memory allocation failure
    xor     rax, rax         ; Set return value to 0 (indicating failure)
    ret

generateRandomVector:
    ; Input:
    ;   rdi: size (number of elements in the array)
    ; Output:
    ;   rax: pointer to the allocated array

    ; Allocate memory for the array
    push    rdi              ; Preserve size
    imul    rdi, rdi, 8      ; Calculate size * sizeof(double)
    call    malloc           ; Allocate memory for the array
    pop     rcx              ; Restore size

    ; Check for allocation success
    cmp     rax, 0           ; Check if rax contains zero (indicating failure)
    je      allocation_failed

    ; Initialize loop counter and store random double values in the array
    xor     rsi, rsi         ; Clear loop counter
populate_random_loop:
    call    random_double    ; Call function to generate random double
    movsd   qword [rax + rsi * 8], xmm0  ; Store random double in the array
    inc     rsi              ; Increment loop counter
    cmp     rsi, rcx         ; Compare loop counter with size
    jl      populate_random_loop  ; Jump if not reached end of array

    ret

random_double:
    ; Generates a random double in the range [0, 1)
    ; Output:
    ;   xmm0: random double

    ; Seed random number generator
    mov     rdi, 0            ; Seed value (0 for default seed)
    call    srand             ; Call srand function

    ; Generate random number
    call    rand              ; Call rand function

    ; Convert random number to double in xmm0
    cvtsi2sd xmm0, eax

    ; Divide by RAND_MAX_DOUBLE (max random number)
    divsd   xmm0, [rel RAND_MAX_DOUBLE]

    ret

calculateDotProduct:
    ; Input:
    ;   rdi: pointer to vector1
    ;   rsi: pointer to vector2
    ;   rdx: size (number of elements in the vectors)
    ; Output:
    ;   xmm0: dot product of the vectors

    xorpd   xmm0, xmm0       ; Clear xmm0 (accumulator)
    xor     rcx, rcx         ; Clear rcx (loop counter)
loop_start:
    movapd  xmm1, [rdi + rcx * 8]  ; Load double from vector1 to xmm1
    movapd  xmm2, [rsi + rcx * 8]  ; Load double from vector2 to xmm2
    mulsd   xmm1, xmm2       ; Multiply doubles pairwise
    addsd   xmm0, xmm1       ; Add the result to accumulator
    inc     rcx              ; Increment loop counter
    cmp     rcx, rdx         ; Compare loop counter with size
    jl      loop_start       ; Jump if not reached end of vectors

    ret
