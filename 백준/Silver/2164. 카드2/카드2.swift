import Foundation

func main() {
    let n = Int(readLine()!)!
    if n == 1 { print(1)
        return
    }
    var arr: [Int] = []
    var cnt = n
    for i in stride(from: 2, through: n, by: 2) {
        arr.append(i)
    }
    while arr.count > 1 {
        var temp: [Int] = []
        var even = false
        if cnt % 2 == 0 { even = true }
        if even {
            for i in stride(from: 1, to: arr.count, by: 2) {
                temp.append(arr[i])
            }
        } else {
            for i in stride(from: 0, to: arr.count, by: 2) {
                temp.append(arr[i])
            }
        }
        cnt += arr.count
        arr = temp
    }
    print(arr[0])
}
main()