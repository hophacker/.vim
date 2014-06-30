
struct segtree{
    int n;
    vector<int> cnt;
    segtree(int n):n(n){
        cnt = vector<int>(2*n+2, 0);
    }
    void add(int t, int l, int r, int L, int R){
        /*
         * Invalid
         *  (1)
         *       L===R
         *             l---------r
         *  (2)
         *                          L======R
         *             l---------r
         * Valid
         *  (1)cnt[t]++
         *            L===========R
         *              l-------r
         *  (2)
         *        L===========R
         *             l---------r
         *  (3)
         *                    L======R
         *             l---------r
         * Segment
         *         L=========R
         *             l----m----r
         *
         */
        if (l > R || r < L) return;
        cnt[t]++;
        if (l == r) return;

        int m = (l+r) >> 1;
        add(t+t, l, m, L, R);
        add(t+t+1, m+1, r, L, R);
    }
    int query(int t, int l, int r, int L, int R){
        if (l > R || r < L) return 0;
        if (L <= l && r <= R){
            return cnt[t];
        }else{
            int m = (l+r) >> 1;
            return max(query(t+t, l, m, L, R), query(t+t+1, m+1, r, L, R));
        }
    }
    int query(int L, int R){
        return query(1, 1, n, L, R);
    }
    void add(int L, int R){
        add(1, 1, n, L, R);
    }
};
