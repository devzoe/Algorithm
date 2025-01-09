import Foundation

func change(_ direction: [(Int,Int)], _ arr: inout [[Bool]]) {
    for d in direction {
        arr[d.0][d.1].toggle()
    }
}

func dfs(_ x: Int, _ arr: inout [[Bool]], _ visited: inout [Bool], _ depth: Int, _ minCost: inout Int, _ callCnt: inout Int) {
    callCnt += 1
    if [0,9].contains(arr.flatMap{$0}.filter{$0 == true}.count) {
        minCost = min(minCost,depth)
        return
    }
    if callCnt == 512 {
        return
    }
    let direction = [[(0,0),(0,1),(0,2)],[(1,0),(1,1),(1,2)],[(2,0),(2,1),(2,2)],
                     [(0,0),(1,0),(2,0)],[(0,1),(1,1),(2,1)],[(0,2),(1,2),(2,2)],
                     [(0,0),(1,1),(2,2)],[(0,2),(1,1),(2,0)]]
    for i in x..<direction.count {
        if !visited[i] {
            visited[i] = true
            change(direction[i], &arr)
            dfs(x, &arr, &visited, depth+1, &minCost, &callCnt)
            visited[i] = false
            change(direction[i], &arr)
        }
    }
}

func main() {
    let n = Int(readLine()!)!
    for _ in 0..<n {
        var arr: [[Bool]] = []
        for _ in 0..<3{
            let line = readLine()!.split(separator: " ").map { $0 == "H" ? true : false}
            arr.append(line)
        }
        var visited: [Bool] = [Bool](repeating: false, count: 8)
        var minCost = Int.max
        var call = 0
        dfs(0, &arr, &visited, 0, &minCost, &call)
        minCost == Int.max ? print(-1) : print(minCost)
    }
}
main()