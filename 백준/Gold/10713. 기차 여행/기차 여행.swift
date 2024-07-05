import Foundation

struct Rail {
    let ticketCost: Int
    let icCost: Int
    let icCardCost: Int
}

func minCost(n: Int, m: Int, route: [Int], costs: [Rail]) -> Int {
    var totalCost = 0
    var icCardUsed = [Bool](repeating: false, count: n - 1)
    var icCardPurchased = [Bool](repeating: false, count: n - 1)
    for day in 1..<m {
        let start = route[day - 1] - 1
        let end = route[day] - 1
        let (s, e) = start < end ? (start, end) : (end, start)  
        for i in s..<e {
            if !icCardPurchased[i] {
                if costs[i].ticketCost > costs[i].icCost + costs[i].icCardCost {
                    totalCost += costs[i].icCardCost
                    icCardPurchased[i] = true
                }
            }
            totalCost += icCardPurchased[i] ? costs[i].icCost : costs[i].ticketCost
        }
    }
    return totalCost
}

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]
let route = readLine()!.split(separator: " ").map { Int($0)! }
var costs = [Rail]()
for _ in 0..<n - 1 {
    let costLine = readLine()!.split(separator: " ").map { Int($0)! }
    let ticketCost = costLine[0]
    let icCost = costLine[1]
    let icCardCost = costLine[2]
    costs.append(Rail(ticketCost: ticketCost, icCost: icCost, icCardCost: icCardCost))
}

let result = minCost(n: n, m: m, route: route, costs: costs)
print(result)
