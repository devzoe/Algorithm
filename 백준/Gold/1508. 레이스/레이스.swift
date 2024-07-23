import Foundation

func readInput() -> (Int, Int, Int, [Int]) {
    let firstLine = readLine()!.split(separator: " " ).map{ Int($0)! }
    let N = firstLine[0], M = firstLine[1], K = firstLine[2]
    let location = readLine()!.split(separator: " " ).map{ Int($0)! }
    return (N, M, K, location)
}

func maxDistance(N: Int, M: Int, K: Int, location: [Int]) {
    if M >= K {
        print(String(repeating: "1", count: K))
    } else {
        var start = 0, end = N
        var ans = [Int]()
        
        while start <= end {
            let mid = (start+end)/2
            var dist = 0
            var check = [0]
            for i in 1..<K {
                if location[i]-location[dist] >= mid {
                    dist = i
                    check.append(i)
                }
                if check.count == M {
                    break
                }
            }
            if check.count == M {
                start = mid+1
                ans = check
            } else {
                end = mid-1
            }
        }
        
        var tempt = Array(repeating: "0", count: K)
        ans.forEach{tempt[$0] = "1"}
        print(tempt.joined())
    }
}

let (N, M, K, location) = readInput()
maxDistance(N: N, M: M, K: K, location: location)
