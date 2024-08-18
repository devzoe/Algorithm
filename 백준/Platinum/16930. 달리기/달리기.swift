import Foundation

struct Queue<T> {
    var array: [T] = []
    var head: Int = 0

    var isEmpty: Bool {
        return head >= array.count
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < array.count else { return nil }
        let element = array[head]
        head += 1
        
        if head > 50 && head * 2 >= array.count {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

func bfs(R: Int, C: Int, K: Int, sy: Int, sx: Int, ey: Int, ex: Int, m: [[Character]]) -> Int {
    let INF = Int(2e9)
    let dy = [0, 1, 0, -1]
    let dx = [1, 0, -1, 0]
    var T = [[Int]](repeating: [Int](repeating: INF, count: C), count: R)
    var queue = Queue<(Int, Int)>()
    
    queue.enqueue((sy, sx))
    T[sy][sx] = 0

    while !queue.isEmpty {
        let qs = queue.array.count - queue.head

        for _ in 0..<qs {
            let (r, c) = queue.dequeue()!
            
            for i in 0..<4 {
                for k in 1...K {
                    let y = r + dy[i] * k
                    let x = c + dx[i] * k

                    if y < 0 || y >= R || x < 0 || x >= C || m[y][x] == "#" || T[y][x] < T[r][c] + 1 {
                        break
                    }
                    
                    if T[y][x] == INF {
                        T[y][x] = T[r][c] + 1
                        queue.enqueue((y, x))
                    }
                }
            }
        }
    }

    return T[ey][ex] == INF ? -1 : T[ey][ex]
}

func main() {
    guard let firstLine = readLine() else { return }
    let firstComponents = firstLine.split(separator: " ").compactMap { Int($0) }
    let R = firstComponents[0], C = firstComponents[1], K = firstComponents[2]
    
    var m = [[Character]]()
    for _ in 0..<R {
        if let line = readLine() {
            m.append(Array(line))
        }
    }
    
    guard let secondLine = readLine() else { return }
    let secondComponents = secondLine.split(separator: " ").compactMap { Int($0) }
    let sy = secondComponents[0] - 1
    let sx = secondComponents[1] - 1
    let ey = secondComponents[2] - 1
    let ex = secondComponents[3] - 1
    
    let result = bfs(R: R, C: C, K: K, sy: sy, sx: sx, ey: ey, ex: ex, m: m)
    print(result)
}

main()
