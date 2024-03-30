#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

extern double calculateDotProduct(double* vector1, double* vector2, int size);

int main() {
    double vector1[] = { 1.0, 2.0, 3.0 };
    double vector2[] = { 4.0, 5.0, 6.0 };
    int size = 3;

    double result = calculateDotProduct(vector1, vector2, size);
    printf("Dot product: %lf\n", result);

    return 0;
}
