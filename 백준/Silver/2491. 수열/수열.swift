import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

if n == 1 {
    print(1)
} else {
    var incCnt = 1
    var decCnt = 1
    var maxL = 1
    
    for i in 1..<n {
        if arr[i] >= arr[i - 1] {
            incCnt += 1
        } else {
            incCnt = 1
        }
        
        if arr[i] <= arr[i - 1] {
            decCnt += 1
        } else {
            decCnt = 1
        }
        
        maxL = max(maxL, incCnt, decCnt)
    }
    print(maxL)
}