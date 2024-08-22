func readInput() -> (Int, Int, [Int], [Int]) {
    let N = Int(readLine()!)!
    var nArray = readLine()!.split(separator: " ").map { Int($0)! }
    let M = Int(readLine()!)!
    let mArray = readLine()!.split(separator: " ").map { Int($0)! }
    nArray.sort()
    return (N, M, nArray, mArray)
}

func binarySearch(_ k: Int, _ N: Int, _ nArray: [Int]) -> Int {
    var start = 0
    var end = N - 1

    while start < end {
        let mid = (start + end)/2
        if nArray[mid] >= k {
            end = mid
        } else {
            start = mid + 1
        }
    }
    if nArray[start] == k { return 1 }
    else { return 0 }
}

let (N, M, nArray, mArray) = readInput()
for i in 0..<M {
    print(binarySearch(mArray[i], N, nArray))
}