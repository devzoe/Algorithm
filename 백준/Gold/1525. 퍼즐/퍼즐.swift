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

        if head > 50 {
            elements.removeFirst(head)
            head = 0
        }
        return element
    }
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func readInput() -> String {
    var start = ""
    for _ in 0..<3 {
        let line = readLine()!.split(separator: " ").map { String($0) }
        start += line.joined()
    }
    return start
}

func bfs(start: String, end: String) -> Int {
    var queue = Queue<(String, Int)>()
    var visited = Set<String>()
    queue.enqueue((start, 0))
    visited.insert(start)
    
    while !queue.isEmpty {
        guard let (current, count) = queue.dequeue() else { break }

        if current == end {
            return count
        }
        
        if let zeroIndex = current.firstIndex(of: "0") {
            let zeroPos = current.distance(from: current.startIndex, to: zeroIndex)
            let x = zeroPos / 3
            let y = zeroPos % 3
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx >= 0 && ny >= 0 && nx < 3 && ny < 3 {
                    var nextState = Array(current)
                    let newPos = nx * 3 + ny
                    nextState.swapAt(zeroPos, newPos)
                    let nextString = String(nextState)
                    
                    if !visited.contains(nextString) {
                        visited.insert(nextString)
                        queue.enqueue((nextString, count + 1))
                    }
                }
            }
        }
    }
    
    return -1
}

func main() {
    let start = readInput()
    let end = "123456780"
    print(bfs(start: start, end: end))
}

main()

