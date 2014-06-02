int binary_search(vector<int> arr, int x){
    if (arr.size() == 0) return -1;
    int L = 0;
    int R = arr.size()-1;
    while(L <= R){
        int M = (L + R) >> 1;
        if (a[M] < x){
            L = M+1;
        }else{
            R = M-1;
        }
    }
    if (L < arr.size() && a[L] == x) return L;
    else return -1;
}

