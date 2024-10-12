import Foundation

struct PriorityQueue<Element> {
    private var elements: [Element] = []
    private let sort: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func push(_ element: Element) {
        elements.append(element)
        elements.sort(by: sort) 
    }

    mutating func pop() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
}

func solution(_ jobs: [[Int]]) -> Int {
    var answer = 0
    var now = 0
    var i = 0
    var start = -1

    var heap = PriorityQueue<(Int, Int)>(sort: { $0.0 < $1.0 })

    let jobList = jobs.map { (requestTime: $0[0], duration: $0[1]) }

    while i < jobs.count {
        for job in jobList {
            if start < job.requestTime && job.requestTime <= now {
                heap.push((job.duration, job.requestTime))
            }
        }

        if !heap.isEmpty {
            if let current = heap.pop() {
                start = now
                now += current.0
                answer += (now - current.1)
                i += 1
            }
        } else {
            now += 1
        }
    }

    return answer / jobs.count
}