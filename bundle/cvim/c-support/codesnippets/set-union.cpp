class SetUnion{
public:
    vector<int> p;
    vector<int> size;
    int n;

    SetUnion(int _n):n(_n){
        p = vector<int>(n, -1);
        size = vector<int>(n, 1);
    }

    int Find(int x){
        if (p[x] == -1) return x;
        else return p[x] = Find(p[x]);
    }

    void Union(int s1, int s2)
    {
        int r1, r2;			/* roots of sets */

        r1 = Find(s1);
        r2 = Find(s2);


        if (r1 == r2) return;		/* already in same set */

        if (size[r1] >= size[r2]) {
            size[r1] = size[r1] + size[r2];
            p[r2] = r1;
        }
        else {
            size[r2] = size[r1] + size[r2];
            p[r1] = r2;
        }
    }

};
