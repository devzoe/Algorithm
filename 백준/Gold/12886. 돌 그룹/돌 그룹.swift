func main() {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let a = abc[0], b = abc[1], c = abc[2]
    let total = a+b+c
    var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: total+1), count: total+1)
    if total % 3 != 0 {
        print(0)
        return
    } else {
        var q: [(Int,Int)] = []
        q.append((a,b))
        visited[a][b] = true
        while !q.isEmpty {
            var (x, y) = q.removeFirst()
            var z = total-x-y
            if x == y && x == z {
                print(1)
                return
            }
            for (i,j) in [(x,y),(y,z),(x,z)] {
                var A = 0
                var B = 0
                var C = 0
                if i < j {
                    B = j - i
                    A = i*2
                } else if i > j {
                    A = i - j
                    B = j*2
                } else {
                    continue
                }
                C = total - A - B
                x = min(A,B,C)
                y = max(A,B,C)
                
                if !visited[x][y] {
                    q.append((x,y))
                    visited[x][y] = true
                }
            }
        }
        print(0)
    }
}
main()