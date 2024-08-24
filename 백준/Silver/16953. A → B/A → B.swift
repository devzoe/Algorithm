import Foundation

func transform(_ a: Int, _ b: Int) -> Int {
    var count = 0
    var current = b
    
    while current > a {
        if current % 2 == 0 {
            current /= 2
        } else if current % 10 == 1 {
            current /= 10
        } else {
            break
        }
        count += 1
    }
    
    return current == a ? count + 1 : -1
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]

let result = transform(a, b)
print(result)