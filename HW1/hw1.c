TreeNode* invertTree(TreeNode* root) {
    if(root==NULL){
        return root;
    }   
    TreeNode* tmp;
    if(root->left){
        tmp = invertTree(root->left);
    }
    if(root->right){
        tmp = invertTree(root->right);
    }
    tmp = root->left;
    root->left= root->right;
    root->right = tmp;
    return root;
}
