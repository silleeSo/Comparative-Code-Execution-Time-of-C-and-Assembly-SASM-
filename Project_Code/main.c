#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "dot.h"
#include "functions.h"

extern double dotProduct(double* vector1, double vector2, int size);

int main() {
    clock_t begin = clock();
    double* vector1;
    double* vector2;
    int vectorSize = pow(2, 20); //Change as needed
    double sdot;
    double executionTime;

    vector1 = generateFixedVector(vectorSize);
    vector2 = generateFixedVector(vectorSize);

    sdot = calculateDotProduct(vector1, vector2, vectorSize);
    printf("The dot product is: %.4f\n", sdot);
    free(vector1);
    free(vector2);

    clock_t end = clock();
    executionTime = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("The execution time is: %.4f\n", executionTime);
    return 0;
}
