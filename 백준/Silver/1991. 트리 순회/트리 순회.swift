let n = Int(readLine()!)!
var tree: [String] = [String](repeating: "", count: 134217728)
tree[1] = "A"
for _ in 0..<n {
    let ch = readLine()!.split(separator: " ").map { String($0) }
    for i in 1..<134217728 {
        if tree[i] == ch[0] {
            if ch[1] != "." {
                tree[i*2] = ch[1]
            }
            if ch[2] != "." {
                tree[i*2+1] = ch[2]
            }
            break
        }
    }
    
}
func preorder(_ curr: Int) {
    if tree[curr] == "" {
        return
    }
    print(tree[curr],terminator: "")
    preorder(curr*2)
    preorder(curr*2+1)
}
func inorder(_ curr: Int) {
    if tree[curr] == "" {
        return
    }
    inorder(curr*2)
    print(tree[curr],terminator: "")
    inorder(curr*2+1)
}
func postorder(_ curr: Int) {
    if tree[curr] == "" {
        return
    }
    postorder(curr*2)
    postorder(curr*2+1)
    print(tree[curr],terminator: "")
}
preorder(1)
print()
inorder(1)
print()
postorder(1)