import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

func main() {
    let file = FileIO()
    let N = file.readInt()
    var arr: [Int] = [-1]
    for _ in 0..<N {
        arr.append(file.readInt())
    }
    let M = file.readInt()
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
    
    for i in 1...N {
        dp[i][i] = true
    }
    
    for i in 1..<N {
        if arr[i] == arr[i + 1] {
            dp[i][i + 1] = true
        }
    }
    
    for i in stride(from: N-2, through: 1, by: -1) {
        for j in i+2...N {
            if (dp[i + 1][j - 1]) && (arr[i] == arr[j]) {
                dp[i][j] = true
            }
        }
    }
    var answer = ""
    for _ in 0..<M {
        let (S, E) = (file.readInt(), file.readInt())
        answer += (dp[S][E] == true ? "1\n" : "0\n")
    }
    print(answer)
}
main()
