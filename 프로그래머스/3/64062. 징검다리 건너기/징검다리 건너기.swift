import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 0
    var end = stones.max()!
    var result = 0
    while start <= end {
        let mid = (start + end) / 2
        var zeroCnt = 0
        for i in 0..<stones.count {   
            let n = stones[i] - mid
            if zeroCnt >= k { break }
            if n <= 0 {
                zeroCnt += 1
            } else {
                zeroCnt = 0
            }
        }
        if zeroCnt >= k {
            result = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }

    return result
}