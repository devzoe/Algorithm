import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() } 
        if now == 45 { isPositive.toggle(); now = read() } 
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

struct PriorityQueue<T> {
    var heap = [T]()
    let order: (T, T) -> Bool

    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }

    mutating func push(_ element: T) {
        heap.append(element)
        var index = heap.count - 1
        while index > 0 && order(heap[index], heap[(index-1)/2]) {
            heap.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast() }
        
        let ret = heap[0]
        heap[0] = heap.removeLast()
        var index = 0
        
        while index*2 + 1 < heap.count {
            var minimumChild = index*2 + 1
            if index*2 + 2 < heap.count && order(heap[index*2 + 2], heap[minimumChild]) {
                minimumChild = index*2 + 2
            }
            
            if order(heap[minimumChild], heap[index]) {
                heap.swapAt(index, minimumChild)
                index = minimumChild
            } else {
                break
            }
        }
        
        return ret
    }
}

let io = FileIO()
let n = io.readInt()
let m = io.readInt()

var graph = [[(Int, Int)]](repeating: [], count: n+1)
for i in 0..<m {
    let a = io.readInt()
    let b = io.readInt()
    graph[a].append((b, i))
    graph[b].append((a, i))
}

var dist = [Int](repeating: Int.max, count: n+1)
dist[1] = 0

var pq = PriorityQueue<(Int, Int)>(order: { $0.1 < $1.1 })
pq.push((1, 0))

while let (current, time) = pq.pop() {
    if current == n {
        print(time)
        exit(0)
    }
    
    if time > dist[current] { continue }
    
    for (next, signal) in graph[current] {
        let waitTime = (m - (time % m) + signal) % m
        let nextTime = time + waitTime + 1
        
        if nextTime < dist[next] {
            dist[next] = nextTime
            pq.push((next, nextTime))
        }
    }
}

print(-1) 