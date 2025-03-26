import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    var result = 0
    if a%b != 0 {
        result = gcd(b, a%b)
    } else {
        return b
    }
    return result
}
let t = Int(readLine()!)!
for _ in 0..<t {
    let nmxy = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m,x,y) = (nmxy[0],nmxy[1],nmxy[2],nmxy[3])
    let maxYear = n*m/gcd(n,m)
    var idx = 0
    while x + idx*n <= maxYear {
        if (x+idx*n) % m == y || y == m && (x+idx*n) % m == 0 {
            break
        }
        idx += 1
    }
    x + idx*n > maxYear ? print(-1) : print(x+idx*n)
}