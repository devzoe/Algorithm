import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let l = A.count
    let a = A.sorted()
    let b = B.sorted()
    var sum = 0
    for i in 0..<l {
        let c = a[i] * b[l-i-1]
        sum += c
    }

    return sum
}