/*
 * =====================================================================================
 *
 *       Filename:  hash_tabel.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  04/05/2014 03:21:56 PM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Jie Feng (http://hey.i-feng.org/), jiefeng.hopkins@gmail.com
 *   Organization:  
 *
 * =====================================================================================
 */


struct node{
    int index;
    int val;
};
#define NOT_FOUND INT_MIN
#undef DEBUG
class hash_map{
private:
    const int hash_prime_len = 50000;
    const int step = 43;
    vector<node> T;
public:
    hash_map(){
        T = vector<node>(hash_prime_len);
        for (int i = 0; i < hash_prime_len; i++)
            T[i].index = NOT_FOUND;
    }
    int getFirstIndex(int x){
        return (x % hash_prime_len + hash_prime_len) % hash_prime_len;
    }
    int& operator [](int x){
        int i = getFirstIndex(x);
        while(T[i].index != NOT_FOUND && T[i].index != x){
            i += step;
            if (i >= hash_prime_len) i -= hash_prime_len;
        }
        T[i].index = x;
        return T[i].val;
    }
    int find(int x){
        int i = getFirstIndex(x);
        while(T[i].index != NOT_FOUND && T[i].index != x){
            i += step;
            if (i >= hash_prime_len) i -= hash_prime_len;
        }
        if (T[i].index == x) return T[i].val;
        else return NOT_FOUND;
    }
};
