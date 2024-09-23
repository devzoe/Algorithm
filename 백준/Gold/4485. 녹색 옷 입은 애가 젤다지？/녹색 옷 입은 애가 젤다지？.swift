import Foundation

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

struct Node: Comparable {
    let x: Int
    let y: Int
    let cost: Int

    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func dijkstra(_ cave: [[Int]], _ n: Int) -> Int {
    var dist = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    dist[0][0] = cave[0][0]
    
    var pq = PriorityQueue<Node>()
    pq.push(Node(x: 0, y: 0, cost: cave[0][0]))
    
    while !pq.isEmpty() {
        let current = pq.pop()!
        
        for i in 0..<4 {
            let nx = current.x + dx[i]
            let ny = current.y + dy[i]
            
            if nx >= 0 && ny >= 0 && nx < n && ny < n {
                let nextCost = current.cost + cave[nx][ny]
                if nextCost < dist[nx][ny] {
                    dist[nx][ny] = nextCost
                    pq.push(Node(x: nx, y: ny, cost: nextCost))
                }
            }
        }
    }
    
    return dist[n-1][n-1]
}

struct PriorityQueue<T: Comparable> {
    private var heap = [T]()
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    func peek() -> T? {
        return heap.first
    }
    
    mutating func push(_ element: T) {
        heap.append(element)
        shiftUp(heap.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            let first = heap.first
            heap[0] = heap.removeLast()
            shiftDown(0)
            return first
        }
    }
    
    private mutating func shiftUp(_ index: Int) {
        var index = index
        while index > 0 && heap[index] < heap[(index - 1) / 2] {
            heap.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }
    
    private mutating func shiftDown(_ index: Int) {
        var index = index
        while index * 2 + 1 < heap.count {
            var child = index * 2 + 1
            if child + 1 < heap.count && heap[child + 1] < heap[child] {
                child += 1
            }
            if heap[index] < heap[child] {
                break
            }
            heap.swapAt(index, child)
            index = child
        }
    }
}

func main() {
    var problemCount = 1
    while true {
        guard let n = Int(readLine()!) else { break }
        if n == 0 { break }
        
        var cave = [[Int]]()
        for _ in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int($0)! }
            cave.append(row)
        }
        
        let result = dijkstra(cave, n)
        print("Problem \(problemCount): \(result)")
        problemCount += 1
    }
}

main()