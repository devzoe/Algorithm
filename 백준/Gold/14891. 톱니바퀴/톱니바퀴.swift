import Foundation

let m = 8
let n = 4

func rotateWheel(_ wheel: inout [[Int]], _ temp: inout [[Int]], _ wheelNum: Int, _ direction: Int) {
    var arr: [Int] = [Int](repeating: 0, count: m)
    if direction == 1 {
        arr[0] = wheel[wheelNum][m-1]
        for i in 1..<m {
            arr[i] = wheel[wheelNum][i-1]
        }
    } else {
        arr[m-1] = wheel[wheelNum][0]
        for i in 0..<m-1 {
            arr[i] = wheel[wheelNum][i+1]
        }
    }
    temp[wheelNum] = arr
}
func isValid(_ i: Int) -> Bool {
    if 0 <= i && i < n {
        return true
    }
    return false
}

func main() {
    var wheel: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    for i in 0..<n {
        let w = readLine()!.map { Int(String($0))! }
        for j in 0..<m {
            wheel[i][j] = w[j]
        }
    }
    let k = Int(readLine()!)!
    for _ in 0..<k {
        let rotate = readLine()!.split(separator: " ").map { Int(String($0))! }
        let wheelNum = rotate[0]-1, d = rotate[1]
        var temp = wheel
        rotateWheel(&wheel, &temp, wheelNum, d)
        var l = wheelNum - 1
        var r = wheelNum + 1
        while l >= 0 {
            if isValid(l) {
                if wheel[l+1][6] != wheel[l][2] {
                    let direction = (wheelNum - l) % 2 == 0 ? d : -d
                    rotateWheel(&wheel, &temp, l, direction)
                    l -= 1
                } else { break }
            }
        }
        while r < n {
            if isValid(r) {
                if wheel[r-1][2] != wheel[r][6] {
                    let direction = (r - wheelNum) % 2 == 0 ? d : -d
                    rotateWheel(&wheel, &temp, r, direction)
                    r += 1
                } else { break }
            }
        }
        wheel = temp
    }
    var result = 0
    for i in 0..<n {
        if wheel[i][0] == 1 {
            result += Int(pow(2.0, Double(i)))
        }
    }
    print(result)
}

main()