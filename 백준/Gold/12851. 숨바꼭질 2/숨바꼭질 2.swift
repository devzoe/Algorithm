//큐
struct Queue<T> {
    private var elements: [T] = []
    private var head: Int = 0
    
    var isEmpty: Bool {
        return head >= elements.count
    }
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        let element = elements[head]
        head += 1
        
        if head > 100 {
            elements.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    var front: T? {
        return isEmpty ? nil : elements[head]
    }
}

func bfs(N: Int, K: Int) -> (Int, Int) {
    var queue = Queue<(position: Int, time: Int)>()
    var visited = Array(repeating: Int.max, count: 100001)
    var ways = 0
    var minTime = Int.max
    
    queue.enqueue((N, 0))
    visited[N] = 0
    
    while !queue.isEmpty {
        let (position, time) = queue.dequeue()!
        
        if position == K {
            if time < minTime {
                minTime = time
                ways = 1
            } else if time == minTime {
                ways += 1
            }
            continue
        }
        
        let nextPositions = [position - 1, position + 1, position * 2]
        
        for next in nextPositions {
            if next >= 0 && next <= 100000 {
                if visited[next] >= time + 1 {
                    visited[next] = time + 1
                    queue.enqueue((next, time + 1))
                }
            }
        }
    }
    
    return (minTime, ways)
}

if let input = readLine()?.split(separator: " ").map({ Int($0)! }) {
    let (N, K) = (input[0], input[1])
    let result = bfs(N: N, K: K)
    print(result.0)
    print(result.1)
}
