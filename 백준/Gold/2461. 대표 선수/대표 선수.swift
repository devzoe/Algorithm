import Foundation

// Heap
struct Heap<T: Comparable> {
    var heap: [T]

    // maxHeap >, minHeap <
    var compare: (T, T) -> Bool

    var root: T? {
        return heap.isEmpty ? nil : heap[0]
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    init(_ compare: @escaping (T, T) -> Bool) {
        heap = []
        self.compare = compare
    }

    // 삽입
    mutating func insert(_ n: T) {
        heap.append(n)
        shiftUp(i: heap.count - 1)
    }

    // 삭제
    @discardableResult
    mutating func delete() -> T? {
        if heap.isEmpty {
            return nil
        }

        if heap.count == 1 {
            return heap.removeFirst()
        }

        heap.swapAt(0, heap.count - 1)

        let result = heap.removeLast()
        shiftDown(i: 0)

        return result
    }

    // 삽입 시 노드 상승
    mutating func shiftUp(i: Int) {
        var now = i

        // 현재 노드가 루트 노드보다 하위 노드일때
        while now > 0 {
            // 부모 노드 인덱스
            let parent = (now - 1) / 2

            // 부모 노드와 대소비교, 교환 필요 시
            if compare(heap[now], heap[parent]) {
                heap.swapAt(now, parent)
                // 교환 후 현재 노드를 원래 부모 노드가 있던 자리로 옮겨줌
                now = parent
            } else {
                break
            }
        }
    }

    // 원소 삭제 시 노드 하강
    mutating func shiftDown(i: Int) {
        var now: Int = i
        // 자식 노드 인덱스
        var child: Int = 2 * now + 1
        let count: Int = heap.count

        // 자식 노드가 트리 범위안에 있을때
        while child < count {
            // 왼쪽 자식, 오른쪽 자식 둘다 있을때
            if child + 1 < count {
                child = compare(heap[child], heap[child + 1]) ? child : child + 1
            }
            // 자식 노드와 대소비교 후 교환
            if compare(heap[child], heap[now]) {
                heap.swapAt(now, child)
                now = child // 현재 노드를 자식노드 인덱스로
                child = 2 * now + 1
            } else {
                break
            }
        }
    }
}

struct Item: Comparable {
    var index: Int
    var value: Int

    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.value < rhs.value
    }
}

func findMinDifference(n: Int, m: Int, arrays: [[Int]]) -> Int {
    var array = arrays
    var pq = Heap<Item>(<) // minHeap

    var top = 0 // 뽑은 최소값들 중 최대값
    var answer = Int.max

    for i in 0..<n {
        var line = array[i].sorted(by: >) // 내림차순 정렬

        top = max(top, line.last!)
        pq.insert(Item(index: i, value: line.removeLast())) // pq 삽입

        array[i] = line
    }

    while !pq.isEmpty {
        let pop = pq.delete()! // 뽑은 최소값들 중 최소값
        answer = min(answer, top - pop.value)

        // 한 라인에서 다 뽑으면 끝
        if array[pop.index].isEmpty {
            break
        }
        
        // 리스트 내 최대값 갱신
        top = max(top, array[pop.index].last!)
        // pq 삽입
        pq.insert(Item(index: pop.index, value: array[pop.index].removeLast()))
    }

    return answer
}

func main() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])

    var arrays = [[Int]]()
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        arrays.append(line)
    }

    let result = findMinDifference(n: n, m: m, arrays: arrays)
    print(result)
}

main()
