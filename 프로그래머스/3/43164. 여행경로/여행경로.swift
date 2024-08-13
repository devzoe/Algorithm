import Foundation

func dfs(_ current: String, _ result: inout [String], _ route: inout [String: [String]], _ visited: inout [[String]: Int], _ ticketsCount: Int) -> Bool {
    result.append(current)

    if result.count == ticketsCount + 1 {
        return true
    }

    if let nextDestinations = route[current] {
        for i in 0..<nextDestinations.count {
            let next = nextDestinations[i]

            if visited[[current, next]]! > 0 {
                visited[[current, next]]! -= 1
                if dfs(next, &result, &route, &visited, ticketsCount) {
                    return true
                }
                visited[[current, next]]! += 1
            }
        }
    }

    result.removeLast()
    return false
}

func solution(_ tickets: [[String]]) -> [String] {
    var route: [String: [String]] = [:]
    var visited: [[String]: Int] = [:]

    for t in tickets {
        route[t[0], default: []].append(t[1])
        visited[t, default: 0] += 1
    }

    for key in route.keys {
        route[key]?.sort()
    }
    
    var result: [String] = []
    let start = "ICN"
    dfs(start, &result, &route, &visited, tickets.count)
    return result
}
