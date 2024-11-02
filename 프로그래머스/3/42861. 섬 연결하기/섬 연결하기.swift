import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {
    let edge = costs.sorted { $0[2] < $1[2] }
    var parent = Array(0..<n)
    var rank = Array(repeating: 0, count: n)
    var total = 0
    var cnt = 0

    for e in edge {
        let u = e[0]
        let v = e[1]
        let cost = e[2]

        var rootU = u
        while rootU != parent[rootU] {
            parent[rootU] = parent[parent[rootU]]
            rootU = parent[rootU]
        }

        var rootV = v
        while rootV != parent[rootV] {
            parent[rootV] = parent[parent[rootV]]
            rootV = parent[rootV]
        }

        if rootU != rootV {
            if rank[rootU] < rank[rootV] {
                parent[rootU] = rootV
            } else if rank[rootU] > rank[rootV] {
                parent[rootV] = rootU
            } else {
                parent[rootV] = rootU
                rank[rootU] += 1
            }

            total += cost
            cnt += 1
            if cnt == n - 1 {
                break
            }
        }
    }

    return total
}