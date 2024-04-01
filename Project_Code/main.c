#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "dot.h"
#include "functions.h"

extern double calculateDotProductAsm(double* vector1, double* vector2, int size);

int main() {
    
    double* vector1;
    double* vector2;
    int vectorSize = pow(2, 20); //Change as needed
    double sdot;
    double executionTime;
    clock_t begin, end;

    vector1 = generateFixedVector(vectorSize);
    vector2 = generateFixedVector(vectorSize);

    begin = clock();
    sdot = calculateDotProductC(vector1, vector2, vectorSize);
    printf("(Using C) The dot product is: %.4f\n", sdot);
    end = clock();
    executionTime = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("(Using C) The execution time is: %.4f\n", executionTime);

    begin = clock();
    sdot = calculateDotProductAsm(vector1, vector2, vectorSize); // Assuming this is your assembly function
    printf("(Using Assembly) The dot product is: %.4f\n", sdot);
    end = clock();
    executionTime = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("(Using Assembly) The execution time is: %.4f\n", executionTime);

    free(vector1);
    free(vector2);

    return 0;
}
