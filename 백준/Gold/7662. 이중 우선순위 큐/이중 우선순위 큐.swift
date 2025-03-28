import Foundation

struct Heap<T> {
    var elements: [T]
    let priority: (T, T) -> Bool
    
    init(priority: @escaping (T, T) -> Bool) {
        self.elements = []
        self.priority = priority
    }
    
    var isEmpty: Bool { elements.isEmpty }
    
    func peek() -> T? {
        return elements.first
    }
    
    mutating func push(_ value: T) {
        elements.append(value)
        siftUp(from: elements.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let popped = elements.removeLast()
        siftDown(from: 0)
        return popped
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        
        while child > 0 && priority(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            
            if left < elements.count && priority(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && priority(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { break }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    var minHeap = Heap<(Int, Int)> { $0.0 < $1.0 }
    var maxHeap = Heap<(Int, Int)> { $0.0 > $1.0 }
    var check = [Bool](repeating: true, count: k)
    
    for i in 0..<k {
        let input = readLine()!.split(separator: " ")
        let command = input[0]
        let num = Int(input[1])!
        
        if command == "I" {
            minHeap.push((num, i))
            maxHeap.push((num, i))
        } else {
            if num == 1 {
                while !maxHeap.isEmpty {
                    let top = maxHeap.pop()!
                    if check[top.1] {
                        check[top.1] = false
                        break
                    }
                }
            } else if num == -1 {
                while !minHeap.isEmpty {
                    let top = minHeap.pop()!
                    if check[top.1] {
                        check[top.1] = false
                        break
                    }
                }
            }
        }
        
        while let top = minHeap.peek(), !check[top.1] {
            _ = minHeap.pop()
        }
        while let top = maxHeap.peek(), !check[top.1] {
            _ = maxHeap.pop()
        }
    }
    
    if minHeap.isEmpty {
        print("EMPTY")
    } else {
        let maxVal = maxHeap.peek()!.0
        let minVal = minHeap.peek()!.0
        print("\(maxVal) \(minVal)")
    }
}