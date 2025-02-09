import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let str = Array(readLine()!)
    let k = Int(readLine()!)!
    var minV = Int.max
    var maxV = 1
    var dict: [Character:[Int]] = [:]
    for (i,s) in str.enumerated() {
        dict[s,default: []].append(i)
    }
    var check = false
    for (_,i) in dict {
        if i.count >= k {
            check = true
            for j in 0...(i.count - k) {
                let l = i[j+k-1] - i[j] + 1
                maxV = max(maxV,l)
                minV = min(minV,l)
            }
        }
    }
    if check {
        print("\(minV) \(maxV)")
    } else {
        print("-1")
    }
}