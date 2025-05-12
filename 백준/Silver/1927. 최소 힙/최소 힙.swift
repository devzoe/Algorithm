import Foundation

struct MinHeap {
    private var heap = [0] 

    var isEmpty: Bool {
        return heap.count <= 1
    }

    mutating func insert(_ value: Int) {
        heap.append(value)
        var index = heap.count - 1

        while index > 1 && heap[index] < heap[index / 2] {
            heap.swapAt(index, index / 2)
            index /= 2
        }
    }

    mutating func pop() -> Int {
        if heap.count <= 1 { return 0 }

        let minValue = heap[1]
        heap[1] = heap[heap.count - 1]
        heap.removeLast()

        var index = 1
        while true {
            let left = index * 2
            let right = index * 2 + 1
            var smallest = index

            if left < heap.count && heap[left] < heap[smallest] {
                smallest = left
            }
            if right < heap.count && heap[right] < heap[smallest] {
                smallest = right
            }
            if smallest == index { break }

            heap.swapAt(index, smallest)
            index = smallest
        }

        return minValue
    }
}

var heap = MinHeap()
let n = Int(readLine()!)!

for _ in 0..<n {
    let x = Int(readLine()!)!
    if x == 0 {
        print(heap.pop())
    } else {
        heap.insert(x)
    }
}