import Foundation

struct MinHeap {
    private var heap: [(abs: Int, original: Int)] = []

    var isEmpty: Bool {
        return heap.isEmpty
    }

    mutating func push(_ value: Int) {
        heap.append((abs(value), value))
        siftUp(from: heap.count - 1)
    }

    mutating func pop() -> Int? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let result = heap.removeLast()
        siftDown(from: 0)
        return result.original
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && compare(heap[child], heap[parent]) {
            heap.swapAt(child, parent)
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

            if left < heap.count && compare(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && compare(heap[right], heap[candidate]) {
                candidate = right
            }
            if candidate == parent { break }

            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }

    private func compare(_ a: (abs: Int, original: Int), _ b: (abs: Int, original: Int)) -> Bool {
        if a.abs == b.abs {
            return a.original < b.original
        }
        return a.abs < b.abs
    }
}

if let n = Int(readLine()!) {
    var heap = MinHeap()

    for _ in 0..<n {
        if let input = readLine(), let num = Int(input) {
            if num != 0 {
                heap.push(num)
            } else {
                if let val = heap.pop() {
                    print(val)
                } else {
                    print(0)
                }
            }
        }
    }
}