import Foundation

func bellmanFord(_ n: Int, _ edges: [(start: Int, end: Int, cost: Int)]) -> [Int] {
    let inf = Int.max
    var distance = [Int](repeating: inf, count: n + 1)
    distance[1] = 0

    for _ in 1..<n {
        for edge in edges {
            let (start, end, cost) = edge
            if distance[start] != inf && distance[start] + cost < distance[end] {
                distance[end] = distance[start] + cost
            }
        }
    }

    for edge in edges {
        let (start, end, cost) = edge
        if distance[start] != inf && distance[start] + cost < distance[end] {
            return [-1] // 음수 사이클 존재
        }
    }

    return distance
}

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])

    var edges = [(start: Int, end: Int, cost: Int)]()

    for _ in 0..<m {
        let busInfo = readLine()!.split(separator: " ").map { Int($0)! }
        edges.append((start: busInfo[0], end: busInfo[1], cost: busInfo[2]))
    }

    let result = bellmanFord(n, edges)

    if result[0] == -1 {
        print(-1)
    } else {
        for i in 2...n {
            if result[i] == Int.max {
                print(-1)
            } else {
                print(result[i])
            }
        }
    }
}

main()
