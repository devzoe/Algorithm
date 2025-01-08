import Foundation

func checkVisit(_ x: Int,_ y: Int, _ visited: inout [[Bool]]) -> Bool {
    let direction = [(0,1),(0,-1),(1,0),(-1,0)]
    if visited[x][y] {
        return true
    }
    for d in direction{
        if visited[x+d.0][y+d.1] {
            return true
        }
    }
    return false
}

func visit(_ x: Int,_ y: Int, _ arr: [[Int]], _ visited: inout [[Bool]], _ tf: Bool) -> Int {
    let direction = [(0,1),(0,-1),(1,0),(-1,0)]
    var cost = arr[x][y]
    visited[x][y] = tf
    for d in direction{
        visited[x+d.0][y+d.1] = tf
        cost += arr[x+d.0][y+d.1]
    }
    return cost
}

func dfs(_ n: Int, _ i: Int, _ j: Int, _ arr: [[Int]], _ cost: Int, _ visited: inout [[Bool]], _ minCost: inout Int, _ depth: Int) {
    if depth == 3 {
        minCost = min(minCost, cost)
        return
    }
    let direction = [(0,1),(0,-1),(1,0),(-1,0)]
    let next = [(0,1),(1,0)]
    var yy = j
    for x in i..<n-1 {
        for y in yy..<n-1 {
            if checkVisit(x, y, &visited) { continue }
            let c = visit(x, y, arr, &visited, true)
            dfs(n,x,y,arr,cost+c,&visited,&minCost,depth+1)
            visit(x,y,arr,&visited,false)
        }
        yy = 1
    }
}

func main() {
    let n = Int(readLine()!)!
    var arr: [[Int]] = []
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append(line)
    }
    var minCost = Int.max
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    dfs(n, 1, 1, arr, 0, &visited, &minCost, 0)
    print(minCost)
}
main()
