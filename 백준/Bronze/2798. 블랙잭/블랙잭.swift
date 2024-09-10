let line = readLine()!.split(separator: " ").map { Int($0)! }
let m = line[0], target = line[1]
var arr = readLine()!.split(separator: " ").map { Int($0)! }
var result = -1
outerloop: for i in 0..<m-2 {
    for j in i+1..<m-1 {
        for k in j+1..<m {
            let n = arr[i]+arr[j]+arr[k]
            if n <= target {
                if n == target { result = n; break outerloop}
                result = max(result, n)
            }
        }
    }
}
print(result)