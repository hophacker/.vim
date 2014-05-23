template <class typev>
class FenwickTree{
private:
    int n;
    vector<typev> val;
public:
    FenwickTree(int _n):n(_n){
        val = vector<typev>(n+1, 0);
    }
    void add(int i, int v){
        for (; i < n; val[i] += v, i += lowb(i));
    }
    typev query(int i){
        typev s = 0;
        for (; i > 0; s += val[i], i -= lowb(i));
        return s;
    }
};
