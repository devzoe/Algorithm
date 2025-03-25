import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0],nm[1])
var arr:[Int] = [Int](repeating: 0, count: 101)
for _ in 0..<(n+m){
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    arr[a[0]] = a[1]
}
var queue: [Int] = [1]
var visited: [Int] = [Int](repeating: 0, count: 101)
visited[1] = 1
while !queue.isEmpty {
    let curr = queue.removeFirst()
    for i in 1...6 {
        let x = curr + i
        if 100 < x || visited[x] != 0 { continue }
        visited[x] = visited[curr]+1
        if arr[x] != 0 {
            let j = arr[x]
            if visited[j] != 0 { continue }
            visited[j] = visited[x]
            queue.append(j)
        } else {
            queue.append(x)
        }
    }
}
print(visited[100]-1)