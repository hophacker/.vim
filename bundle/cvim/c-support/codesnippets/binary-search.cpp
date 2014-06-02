
#include<iostream>
using namespace std;
/*  
 * 
 *
 */


/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  upper
 *  Description:  Find the last element in A which is  <=  x
 *                return the position(0..n-1) or 
 *                return -1 if all the elements in A is larger than x
 * =====================================================================================
 */
int upper(int A[], int n, int x){
    int L = 0, R = n-1;
    while(L <= R){
        int M = (L + R) >> 1;
        if (A[M] > x)
            R = M - 1;
        else L = M+1;
    }
    return R;
}
/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  lower
 *  Description:  Find the last element in A which is  >=  x
 *                return the position(0..n-1) or 
 *                return n if all the elements in A is smaller than x
 * =====================================================================================
 */
int lower(int A[], int n, int x){
    int L = 0, R = n-1;
    while(L <= R){
        int M = (L + R) >> 1;
        if (A[M] < x)
            L = M+1;
        else R = M-1;
    }
    return L;
}
int main(){
    int A[] = {1,2,3,3,3,3,89};
    int x;
    int n = sizeof(A)/4;
    cout  << n << endl;
    while(cin >> x){
        for (int j = 0; j < n; j++) cout << A[j] << ' ' ;
        cout << endl;
        cout << lower(A, n, x) << ' ' << upper(A, n, x) << endl;
    }
}
