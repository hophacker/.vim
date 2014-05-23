#define mod 7
void ex_euclid(ll a, ll& x, ll b, ll& y){
    ll x1, y1;
    if (a == 1){
        x = 1;
        y = 0;
        return;
    }
    ex_euclid(b%a, x1, a, y1);
    y = x1;
    x = y1 - (b/a) * x1;
}
ll rev_mod(ll a){
    ll x, y;
    ex_euclid(a,x,mod,y);
    return (x%mod+mod)%mod;
}
