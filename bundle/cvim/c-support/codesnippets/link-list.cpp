struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
    ListNode *sortList(ListNode *head) {
        int total, c;
        ListNode *tail, *head1, *head2;
        if (head == NULL || head->next == NULL) return head;
        //if cotains zero or one element, return directly
        tail = head;
        total = 0;
        while(tail != NULL){
            tail = tail->next;
            total++;
        }
        //total elements
        c = 1;
        tail = head;
        while(c < total/2)
            tail = tail->next, c++;
        head2 = tail->next;
        tail->next = NULL;
        //make tail to the element to the index of total/2+1
        head1 = sortList(head);
        head2 = sortList(head2);
        if (head1->val > head2->val){
            head = head2;
            head2 = head2->next;
        }else{
            head = head1;
            head1 = head1->next;
        }
        tail = head;
        while(head1 != NULL && head2 != NULL){
            if (head1->val > head2->val){
                tail->next = head2;
                head2 = head2->next;
            }else{
                tail->next = head1;
                head1 = head1->next;
            }
            tail = tail->next;
        }
        if (head1 != NULL) tail->next = head1;
        if (head2 != NULL) tail->next = head2;
        return head;
    }
};
void addNode(ListNode* &head, int x){
    ListNode *a = new ListNode(x);
    if (head == NULL){
        head = a;
    }else{
        a->next = head;
        head = a;
    }
}
void printList(ListNode* head){
    while(head != NULL){
        cout << head->val << ' ';
        head = head->next;
    }
    cout << endl;
}
int main ( int argc, char *argv[] ) {
    ListNode* a = NULL;
    addNode(a, 1);
    addNode(a, 3);
    addNode(a, 2);
    addNode(a, 5);
    printList(a);
    Solution s = Solution();
    a = s.sortList(a);
    printList(a);
    return EXIT_SUCCESS;
}
