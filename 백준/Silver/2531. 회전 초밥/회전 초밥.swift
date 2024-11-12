import Foundation

func main() {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let n = line[0], d = line[1], k = line[2], c = line[3]
    var arr: [Int] = []
    for _ in 0..<n {
        let a = Int(readLine()!)!
        arr.append(a)
    }
    arr = arr + arr[0..<k]
    var dict: [Int:Int] = [:]
    for i in 0..<k {
        dict[arr[i], default: 0] += 1
    }
    var maxVal = -1
    if dict.keys.contains(c) {
        maxVal = dict.keys.count
    } else {
        maxVal = dict.keys.count + 1
    }
    for i in k..<n+k {
        dict[arr[i-k]]! -= 1
        if dict[arr[i-k]]! <= 0 { dict[arr[i-k]] = nil }
        dict[arr[i], default: 0] += 1
        var ans = 0
        if dict.keys.contains(c) {
            ans = dict.keys.count
        } else {
            ans = dict.keys.count + 1
        }
        maxVal = max(maxVal, ans)
    }
    print(maxVal)
}
main()