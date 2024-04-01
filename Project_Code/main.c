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
    int vectorSize = pow(2, 20);
    double sdot, sdotC, sdotAssem;
    double executionTime;
    double aveETimeC = 0;
    double aveETimeAssem = 0;
    int i;
    clock_t begin, end;

    vector1 = generateFixedVector(vectorSize);
    vector2 = generateFixedVector(vectorSize);


    for (i = 1; i < 31; i++) {
        printf("Try %d\n", i);
        printf("----------------------------------------------------------------\n");
        begin = clock();
        sdot = calculateDotProductC(vector1, vector2, vectorSize);
        printf("(Using C) The dot product is: %.4f\n", sdot);
        end = clock();
        executionTime = (double)(end - begin) / CLOCKS_PER_SEC;
        printf("(Using C) The execution time is: %.4f\n", executionTime);
        sdotC = sdot;

        aveETimeC += executionTime;

        begin = clock();
        sdot = calculateDotProductAsm(vector1, vector2, vectorSize); // Assuming this is your assembly function
        printf("(Using Assembly) The dot product is: %.4f\n", sdot);
        end = clock();
        executionTime = (double)(end - begin) / CLOCKS_PER_SEC;
        printf("(Using Assembly) The execution time is: %.4f\n", executionTime);
        sdotAssem = sdot;

        aveETimeAssem += executionTime;
        isCorrect(sdotC, sdotAssem);
    }

    printf("C Average Execution Time: %.4f\n", getAverageExecTime(aveETimeC));
    printf("Assembly Average Execution Time: %.4f\n", getAverageExecTime(aveETimeAssem));
    free(vector1);
    free(vector2);

    return 0;
}
