import Foundation

let MAX = 100
var vis = [Int](repeating: 0, count: MAX)

func bfs(_ linked: [[Int]], _ st: Int) -> Int {
    vis = [Int](repeating: 0, count: MAX)
    var queue = [Int]()
    vis[st] = 1
    queue.append(st)
    
    var cnt = 0
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for next in linked[cur] {
            if vis[next] != 0 { continue }
            queue.append(next)
            vis[next] = 1
            cnt += 1
        }
    }
    return cnt
}

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0]
    let m = nm[1]
    
    var heavier = [[Int]](repeating: [Int](), count: n + 1)
    var lighter = [[Int]](repeating: [Int](), count: n + 1)
    
    for _ in 0..<m {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let u = uv[0]
        let v = uv[1]
        heavier[u].append(v)
        lighter[v].append(u)
    }
    
    var ans = 0
    
    for st in 1...n {
        let big = bfs(lighter, st)   
        let small = bfs(heavier, st)

        if big > (n - 1) / 2 || small > (n - 1) / 2 {
            ans += 1
        }
    }
    
    print(ans)
}

main()
