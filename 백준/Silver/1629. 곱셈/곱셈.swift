import Foundation

func powMod(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 0 {
        return 1
    }
    let half = powMod(a, b / 2, c)
    if b % 2 == 0 {
        return (half * half) % c
    } else {
        return ((half * half) % c * a % c) % c
    }
}

let abc = readLine()!.split(separator: " ").map { Int($0)! }
let (a,b,c) = (abc[0],abc[1],abc[2])

print(powMod(a, b, c))