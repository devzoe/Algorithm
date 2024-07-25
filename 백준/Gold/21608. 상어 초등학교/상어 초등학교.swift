import Foundation

let rx = [0, 0, 1, -1]
let ry = [1, -1, 0, 0]

func readInput() -> (Int, [[Int]]) {
    let n = Int(readLine()!)!
    var students = [[Int]]()
    for _ in 0..<(n * n) {
        let student = readLine()!.split(separator: " ").map { Int($0)! }
        students.append(student)
    }
    return (n, students)
}

func findSeat(n: Int, students: [[Int]]) -> [[Int]] {
    var seats = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var friends = [Int: Set<Int>]()
    
    for student in students {
        let me = student[0]
        friends[me] = Set(student[1...])
        var possible = [(Int, Int, Int, Int)]()
        
        for x in 0..<n {
            for y in 0..<n {
                if seats[x][y] == 0 {
                    var empty = 0
                    var friend = 0
                    for direction in 0..<4 {
                        let nx = x + rx[direction]
                        let ny = y + ry[direction]
                        if 0 <= nx && nx < n && 0 <= ny && ny < n {
                            if seats[nx][ny] == 0 {
                                empty += 1
                            }
                            if friends[me]!.contains(seats[nx][ny]) {
                                friend += 1
                            }
                        }
                    }
                    possible.append((friend, empty, x, y))
                }
            }
        }
        
        possible.sort {
            if $0.0 != $1.0 {
                return $0.0 > $1.0
            }
            if $0.1 != $1.1 {
                return $0.1 > $1.1
            }
            if $0.2 != $1.2 {
                return $0.2 < $1.2
            }
            return $0.3 < $1.3
        }
        
        let (_, _, x, y) = possible[0]
        seats[x][y] = me
    }
    return seats
}

func calculateSatisfaction(n: Int, seats: [[Int]], friends: [Int: Set<Int>]) -> Int {
    var answer = 0
    
    for x in 0..<n {
        for y in 0..<n {
            let me = seats[x][y]
            var friend = 0
            for direction in 0..<4 {
                let nx = x + rx[direction]
                let ny = y + ry[direction]
                if 0 <= nx && nx < n && 0 <= ny && ny < n {
                    if friends[me]!.contains(seats[nx][ny]) {
                        friend += 1
                    }
                }
            }
            if friend > 0 {
                answer += Int(pow(10.0, Double(friend - 1)))
            }
        }
    }
    return answer
}

let (n, students) = readInput()
let seats = findSeat(n: n, students: students)
var friends = [Int: Set<Int>]()
for student in students {
    friends[student[0]] = Set(student[1...])
}
let satisfaction = calculateSatisfaction(n: n, seats: seats, friends: friends)
print(satisfaction)
