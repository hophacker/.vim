int largestRectangleArea(vector<int> &height) {
    stack<int> pre;
    int i = 0;
    int max_area = 0;
    height.push_back(-1);
    while(i < height.size()){
        if (pre.empty() || height[i] > height[pre.top()]){
            pre.push(i++);
        }else{
            int h = height[pre.top()]; pre.pop();
            max_area = max(max_area, h * (pre.empty()?i:i-pre.top()-1));
        }
    }
    height.pop_back();
    return max_area;
}
