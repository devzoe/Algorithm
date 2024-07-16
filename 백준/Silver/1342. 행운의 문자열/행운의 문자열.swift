import Foundation

func nextPermutation(_ s: inout [Character]) -> Bool {
    let n = s.count
    var i = n - 2
    while i >= 0 && s[i] >= s[i + 1] {
        i -= 1
    }
    if i == -1 {
        return false
    }
    var j = n - 1
    while s[i] >= s[j] {
        j -= 1
    }
    s.swapAt(i, j)
    s[(i + 1)...].reverse()
    return true
}

func isValidPermutation(_ s: [Character]) -> Bool {
    for i in 0..<s.count - 1 {
        if s[i] == s[i + 1] {
            return false
        }
    }
    return true
}

func main() {
    let s = readLine()!
    var charArray = Array(s).sorted()
    var answer = 0
    
    repeat {
        if isValidPermutation(charArray) {
            answer += 1
        }
    } while nextPermutation(&charArray)
    print(answer)
}

main()
