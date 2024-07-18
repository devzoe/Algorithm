import Foundation

func makeTile(n: Int) -> Int {
    var tile = [Int](repeating: 1, count: n+1)
    if n == 1 {
        return 1
    } else {
        for i in 2...n {
            tile[i] = (tile[i-1] + tile[i-2]) % 10007
        }
    }
    return tile[n]
}
let n = Int(readLine()!)!
let result = makeTile(n: n)
print(result)