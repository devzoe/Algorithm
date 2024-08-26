import Foundation

struct Queue<T> {
    private var array: [T] = []
    private var head: Int = 0

    var isEmpty: Bool {
        return head >= array.count
    }

    var count: Int {
        return array.count - head
    }

    mutating func enqueue(_ element: T) {
        array.append(element)
    }

    mutating func dequeue() -> T? {
        guard head < array.count else {
            return nil
        }

        let element = array[head]
        head += 1

        if head > 50 {
            array.removeFirst(head)
            head = 0
        }

        return element
    }

    func peek() -> T? {
        return isEmpty ? nil : array[head]
    }
}

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var result: [Int] = []
    var a = Queue<Int>()
    var b = Queue<Int>()
    
    for p in progresses {
        a.enqueue(p)
    }
    for s in speeds {
        b.enqueue(s)
    }
    
    while !a.isEmpty {
        let n = a.count
        
        for _ in 0..<n {
            let updated = a.dequeue()! + b.peek()!
            a.enqueue(updated)
            b.enqueue(b.dequeue()!)
        }
        
        var count = 0
        while let progress = a.peek(), progress >= 100 {
            count += 1
            a.dequeue()
            b.dequeue()
        }
        
        if count > 0 {
            result.append(count)
        }
    }
    
    return result
}