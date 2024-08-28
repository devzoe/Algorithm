import Foundation

let MOD = 1000000007

func d1(_ n: Int, _ h: Int, _ dp: inout [[Int]]) -> Int {  
    if n < 0 { return 0 }
    if n == 0 { return h == 0 ? 1 : 0 }
    
    var ret = dp[h][n]
    if ret != 0 { return ret }
    
    ret = 0
    if h == 0 {
        ret = (d1(n-1, 0, &dp) + d1(n-1, 1, &dp) + d1(n-1, 2, &dp)) % MOD
    } else if h == 1 {
        ret = (2 * d1(n-2, 0, &dp) + d1(n-1, 0, &dp)) % MOD
    } else if h == 2 {
        ret = (d1(n-2, 0, &dp) + d1(n-1, 0, &dp)) % MOD
    }
    
    dp[h][n] = ret
    return ret
}

func d2(_ n: Int, _ h: Int, _ dp2: inout [[Int]]) -> Int {
    if n < 0 { return 0 }
    if n == 0 { return h == 0 ? 1 : 0 }
    
    var ret = dp2[h][n]
    if ret != 0 { return ret }
    
    ret = 0
    if h == 0 {
        ret = (d2(n-1, 0, &dp2) + d2(n-1, 1, &dp2)) % MOD
    } else if h == 1 {
        ret = (d2(n-2, 0, &dp2) + d2(n-1, 0, &dp2)) % MOD
    }
    
    dp2[h][n] = ret
    return ret
}

func solution(_ n: Int) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 3)
    var dp2 = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 3)
    
    let result = (d1(n, 0, &dp) - d2(n, 0, &dp2) + MOD) % MOD
    return result
}

if let input = readLine(), let n = Int(input) {
    let result = solution(n)
    print(result)
}
