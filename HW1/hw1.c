class Solution {
public:
    int findNumbers(vector<int>& nums) {
        int i, val;
        val=0;
        for(i=0; i<nums.size(); i++){
            if((calculate(nums[i])&1)==0){
                val=val+1;
            }
        }
        return val;
    }
    int calculate(int a){
        int base = 10;
        int digit = 1;
        while(a>=base){
            digit = digit+1;
            base = (base<<3)+(base<<1);
        }
        return digit;
    }
};
