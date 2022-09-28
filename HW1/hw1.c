#include <stdio.h>

int arr1[5] = {11, 2, 52, 14, 62};
int arr2[4] = {95, 8711, 26, 6};
int arr3[3] = {19, 137, 55, 77, 33, 22};
int size1 = 5;
int size2 = 4;
int size3 = 6;

int calculate(int a){
    int base = 10;
    int digit = 1;
    while(a>=base){
        digit = digit+1;
        base = (base<<3)+(base<<1);
    }
    return digit;
}

int findNumbers(int* nums, int size){
    int i, val;
    val=0;
    for(i=0; i<size; i++){
        if((calculate(nums[i])&1)==0){
            val=val+1;
        }
    }
    return val;
}

int main(void){
    int save;
    save = findNumbers(arr1, size1);
    printf("The array has %d even digit numbers.\n", save);
    save = findNumbers(arr2, size2);
    printf("The array has %d even digit numbers.\n", save);
    save = findNumbers(arr3, size3);
    printf("The array has %d even digit numbers.\n", save);
    return 0;
}
