func permutation(_ arr: inout [Character]) -> Bool {
    var i = arr.count - 2
    while i >= 0 && arr[i] >= arr[i + 1] {
        i -= 1
    }
    if i == -1 {
        return false
    }
    var j = arr.count - 1
    while arr[j] <= arr[i] {
        j -= 1
    }
    arr.swapAt(i, j)
    arr[(i + 1)...].reverse()
    return true
}

func main() {
    let t = Int(readLine()!)!
    for _ in 0..<t {
        var word = Array(readLine()!)
        if permutation(&word) {
            print(String(word))
        } else {
            print(String(word))
        }
    }
}
main()
