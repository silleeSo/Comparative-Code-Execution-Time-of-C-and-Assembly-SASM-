#include <stdio.h>
#include <stdlib.h>
#include "dot.h"

// Function definition
double calculateDotProductC(double* vector1, double* vector2, int size) {
    double dotProduct = 0.0;
    //for each element in vector1 and vector2, multiply them with each other and add to dotProduct
    for (int i = 0; i < size; i++)
        dotProduct += (vector1[i] * vector2[i]);

    return dotProduct;
}
