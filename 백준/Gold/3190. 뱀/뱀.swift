import Foundation

struct Queue<T> {
    var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
    }

    mutating func dequeue() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }

    func peek() -> T? {
        return elements.first
    }
}

func solution() {
    let N = Int(readLine()!)!
    var baseLst = Array(repeating: Array(repeating: 0, count: N), count: N)

    let appleN = Int(readLine()!)!
    for _ in 0..<appleN {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x = input[0] - 1
        let y = input[1] - 1
        baseLst[x][y] = 1
    }

    let operN = Int(readLine()!)!
    var operations = Queue<(Int, Int)>()
    for _ in 0..<operN {
        let input = readLine()!.split(separator: " ")
        let t = Int(input[0])!
        let op = input[1] == "D" ? 1 : -1
        operations.enqueue((t, op))
    }

    var cnt = 0
    var snake = Queue<[Int]>()
    snake.enqueue([0, 0])

    let delta = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var headY = 0
    var headX = 0
    var head = 0

    var currentOperation = operations.dequeue()
    var time = currentOperation?.0 ?? 0
    var op = currentOperation?.1 ?? 0

    while true {
        cnt += 1
        headY += delta[head].0
        headX += delta[head].1

        if !(0 <= headX && headX < N && 0 <= headY && headY < N) {
            break
        }

        if snake.elements.contains([headY, headX]) {
            break
        }

        snake.enqueue([headY, headX])

        if baseLst[headY][headX] == 1 {
            baseLst[headY][headX] = 0
        } else {
            _ = snake.dequeue()
        }

        if cnt == time {
            head = (head + op) % 4
            if head < 0 { head += 4 } 
            if let nextOperation = operations.dequeue() {
                time = nextOperation.0
                op = nextOperation.1
            }
        }
    }

    print(cnt)
}

solution()
