#include <stdio.h>
#define SIZE 3  // Define matrix size

void matrixMultiply(int a[SIZE][SIZE], int b[SIZE][SIZE], int result[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            result[i][j] = 0;  // Initialize result matrix
            for (int k = 0; k < SIZE; k++) {
                result[i][j] += a[i][k] * b[k][j];  // Perform multiplication
            }
        }
    }
}

__int64
sampleone (
  )
{
  int a[SIZE][SIZE] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };

    int b[SIZE][SIZE] = {
        {9, 8, 7},
        {6, 5, 4},
        {3, 2, 1}
    };

    int result[SIZE][SIZE];

    matrixMultiply(a, b, result);
    return 0;
}
