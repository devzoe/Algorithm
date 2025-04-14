let n = Int(readLine()!)!
var tree: [String:[String]] = [:]
var ordered = ["","",""]
for _ in 0..<n {
    let ch = readLine()!.split(separator: " ").map { String($0) }
    tree[ch[0],default: []].append(contentsOf: [ch[1],ch[2]])
}
func order(_ curr: String) {
    if curr == "." { return }
    ordered[0] += curr
    order(tree[curr]![0])
    ordered[1] += curr
    order(tree[curr]![1])
    ordered[2] += curr
}
order("A")
for i in ordered {
    print(i)
}