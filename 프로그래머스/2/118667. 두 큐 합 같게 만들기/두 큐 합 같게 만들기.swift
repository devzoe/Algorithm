import Foundation

func getSum(_ arr: [Int]) -> Int {    
    return arr.reduce(0,+)
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let total = getSum(queue1) + getSum(queue2)
    if total % 2 != 0 { return -1 }
    let half = total/2
    var q = queue1 + queue2
    var result = 0
    var start = 0
    var end = queue1.count
    var sum = getSum(queue1)
    while start < end {
        if sum == half { break }
        if end >= q.count { break }
        if sum < half { 
            sum += q[end]
            end += 1
        } else {
            sum -= q[start]
            start += 1
        }
        result += 1
    }
    if sum != half { return -1 }
    
    return result
}