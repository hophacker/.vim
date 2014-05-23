vector<vector<ll> > generateComb(int n){
    vector<vector<ll> > comb;
    comb.push_back(vector<ll>());
    FE(i,1,n){
        comb.push_back(vector<ll>());
        comb[i].push_back(1);
        FE(j,1,i-1){
            comb[i].push_back(comb[i-1][j-1] + comb[i-1][j]);
        }
        comb[i].push_back(1);
    }
    return comb;
}

vector<int> generateDigits(ll n){
    vector<int> res;
    if (n == 0) res.push_back(0);
    while(n){
        res.push_back(n % 10);
        n /= 10;
    }
    return res;
}
