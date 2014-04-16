#include "leetcode.h"
int main()
{
    //int num[] = {10,1,2,7,6,1,5};
    int num[] = {};
    vector<int> vnum(num, num+sizeof(num)/4);
    vvi res = Solution().combinationSum2(vnum, 8);
    printVV(res);
}
