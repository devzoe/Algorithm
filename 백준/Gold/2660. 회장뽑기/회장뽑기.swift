import Foundation

func floydWarshall(n: Int, dist: inout [[Int]]) {
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if dist[i][k] != Int.max && dist[k][j] != Int.max {
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
                }
            }
        }
    }
}

func calculateScores(n: Int, dist: [[Int]]) -> (minScore: Int, scores: [Int]) {
    var scores = [Int](repeating: 0, count: n + 1)
    var minScore = Int.max
    for i in 1...n {
        var maxDist = 0
        for j in 1...n {
            if dist[i][j] != Int.max {
                maxDist = max(maxDist, dist[i][j])
            }
        }
        scores[i] = maxDist
        minScore = min(minScore, maxDist)
    }
    return (minScore, scores)
}

func findCandidates(n: Int, minScore: Int, scores: [Int]) -> [Int] {
    var candidates = [Int]()
    for i in 1...n {
        if scores[i] == minScore {
            candidates.append(i)
        }
    }
    return candidates
}

func main() {
    let n = Int(readLine()!)!
    var dist = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
    for i in 1...n {
        dist[i][i] = 0
    }

    while true {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let u = line[0], v = line[1]
        if u == -1 && v == -1 { break }
        dist[u][v] = 1
        dist[v][u] = 1
    }
    
    floydWarshall(n: n, dist: &dist)
    
    let (minScore, scores) = calculateScores(n: n, dist: dist)
    let candidates = findCandidates(n: n, minScore: minScore, scores: scores)
    
    print(minScore, candidates.count)
    print(candidates.map { String($0) }.joined(separator: " "))
}

main()
