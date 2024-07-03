import Foundation

struct Edge {
    let destination: Int
    let length: Int
}

func readInput() -> (Int, [Int], Int, [[(Int, Int)]]) {
    let N = Int(readLine()!)!
    let friends = readLine()!.split(separator: " ").map { Int($0)! }
    let M = Int(readLine()!)!
    
    var graph = Array(repeating: [(Int, Int)](), count: N + 1)
    
    for _ in 0..<M {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let D = input[0]
        let E = input[1]
        let L = input[2]
        graph[D].append((E, L))
        graph[E].append((D, L))
    }
    
    return (N, friends, M, graph)
}

func bfs(from start: Int, in graph: [[(Int, Int)]], N: Int) -> [Int] {
    var distances = Array(repeating: Int.max, count: N + 1)
    var queue = [(start, 0)]
    distances[start] = 0
    
    var index = 0
    while index < queue.count {
        let (current, dist) = queue[index]
        index += 1
        
        for (neighbor, length) in graph[current] {
            if distances[neighbor] > dist + length {
                distances[neighbor] = dist + length
                queue.append((neighbor, dist + length))
            }
        }
    }
    
    return distances
}

let (N, friends, M, graph) = readInput()
let distancesFromA = bfs(from: friends[0], in: graph, N: N)
let distancesFromB = bfs(from: friends[1], in: graph, N: N)
let distancesFromC = bfs(from: friends[2], in: graph, N: N)

var maxMinDistance = -1
var resultLand = -1

for land in 1...N {
    let minDistance = min(distancesFromA[land], distancesFromB[land], distancesFromC[land])
    
    if minDistance > maxMinDistance {
        maxMinDistance = minDistance
        resultLand = land
    } else if minDistance == maxMinDistance && land < resultLand {
        resultLand = land
    }
}
print(resultLand)
