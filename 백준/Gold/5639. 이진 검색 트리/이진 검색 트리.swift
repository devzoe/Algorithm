var tree: [Int] = []
func postorder(_ start: Int, _ end: Int) {
    if start > end { return }
    var mid = end + 1
    
    for i in start+1..<end+1 {
        if tree[start] < tree[i] {
            mid = i
            break
        }
    }
    
    postorder(start + 1, mid - 1)
    postorder(mid, end)
    print(tree[start])
}

while let line = readLine(), let node = Int(line) { tree.append(node) }
postorder(0, tree.count - 1)