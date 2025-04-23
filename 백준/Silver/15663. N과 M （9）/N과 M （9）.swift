let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
let num = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var visited = [Bool](repeating: false, count: n)
var answer = [Int]()

func dfs() {
    if answer.count == m {
        print(answer.map { String($0) }.joined(separator: " "))
        return
    }
    
    var check: Int? = nil
    
    for i in 0..<n {
        if visited[i] == false && check != num[i] {
            visited[i] = true
            answer.append(num[i])
            check = num[i]
            
            dfs()
            
            visited[i] = false
            answer.removeLast()
        }
    }
}

dfs()