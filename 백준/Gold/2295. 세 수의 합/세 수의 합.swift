import Foundation

func readInput() -> (Int, [Int]) {
    let n = Int(readLine()!)!
    var arr = [Int]()
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    return (n, arr)
}

func main() {
    var (n, arr) = readInput()
    arr.sort()
    var sample = Set<Int>()
    
    for x in arr {
        for y in arr {
            sample.insert(x + y)
        }
    }

    func solve() -> Int? {
        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in 0...i {
                if sample.contains(arr[i] - arr[j]) {
                    return arr[i]
                }
            }
        }
        return nil
    }
    
    if let result = solve() {
        print(result)
    }
}

main()
