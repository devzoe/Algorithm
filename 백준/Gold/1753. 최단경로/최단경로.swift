import Foundation

struct Edge {
    let destination: Int
    let weight: Int
}

struct Node: Comparable {
    let vertex: Int
    let cost: Int
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func dijkstra(_ start: Int, _ graph: [[Edge]], _ distances: inout [Int]) {
    var priorityQueue = PriorityQueue<Node>()
    distances[start] = 0
    priorityQueue.push(Node(vertex: start, cost: 0))
    
    while !priorityQueue.isEmpty() {
        let current = priorityQueue.pop()!
        
        if current.cost > distances[current.vertex] {
            continue
        }
        
        for edge in graph[current.vertex] {
            let newCost = current.cost + edge.weight
            
            if newCost < distances[edge.destination] {
                distances[edge.destination] = newCost
                priorityQueue.push(Node(vertex: edge.destination, cost: newCost))
            }
        }
    }
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
    let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
    let V = firstLine[0]
    let E = firstLine[1]
    
    let start = Int(readLine()!)!
    
    var graph = Array(repeating: [Edge](), count: V + 1)
    
    for _ in 0..<E {
        let edgeInfo = readLine()!.split(separator: " ").map { Int($0)! }
        let u = edgeInfo[0]
        let v = edgeInfo[1]
        let w = edgeInfo[2]
        graph[u].append(Edge(destination: v, weight: w))
    }
    
    var distances = Array(repeating: Int.max, count: V + 1)
    dijkstra(start, graph, &distances)
    
    for i in 1...V {
        if distances[i] == Int.max {
            print("INF")
        } else {
            print(distances[i])
        }
    }
}

main()
