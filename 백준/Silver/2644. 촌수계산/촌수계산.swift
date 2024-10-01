import Foundation

func dfs(_ curr: Int, _ target: Int, _ child: [[Int]], _ visited: inout [Bool], _ result: inout Int, _ flag: inout Bool) {
    visited[curr] = true
    result += 1
    if curr == target {
        flag = true
        return
    }
    for next in child[curr] {
        if !visited[next] {
            dfs(next, target, child, &visited, &result, &flag)
            if flag {
                return
            }
        }
    }
    result -= 1
}

func main() {
    let n = Int(readLine()!)!
    let se = readLine()!.split(separator: " ").map { Int($0)! }
    let start = se[0], end = se[1]
    let m = Int(readLine()!)!
    var parent: [[Int]] = [[Int]](repeating: [], count: n+1)
    var child: [[Int]] = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        let p = edge[0], c = edge[1]
        parent[c].append(p)
        child[p].append(c)
    }
    
    var queue: [Int] = [start]
    var visited: [Bool] = [Bool](repeating: false, count: n+1)
    var result = -1
    var flag = false
    while !queue.isEmpty {
        let p = queue.removeFirst()
        if !visited[p] {
            dfs(p, end, child, &visited, &result, &flag)
        }
        if flag {
            break
        }
        if !parent[p].isEmpty {
            queue.append(parent[p][0])
        }
        result += 1
    }
    if flag {
        print(result)
    } else {
        print(-1)
    }
}

main()
