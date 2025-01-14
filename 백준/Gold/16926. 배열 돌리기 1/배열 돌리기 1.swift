import Foundation

func rotateLayer(_ table: inout [[String]], _ start: Int, _ row: Int, _ col: Int, _ r: Int) {
    var (startRow, endRow, startCol, endCol) = (start, row, start, col)
    while startRow < endRow && startCol < endCol {
        var queue: [String] = []
        for i in startRow..<endRow {
            queue.append(table[i][startCol])
        }
        for i in startCol..<endCol {
            queue.append(table[endRow][i])
        }
        for i in stride(from: endRow, to: startRow, by: -1) {
            queue.append(table[i][endCol])
        }
        for i in stride(from: endCol, to: startCol, by: -1) {
            queue.append(table[startRow][i])
        }

        let perimeter = (endRow - startRow + 1) * 2 + (endCol - startCol + 1) * 2 - 4
        let rotation = r % perimeter
        for _ in 0..<rotation {
            queue.insert(queue.removeLast(), at: 0)
        }

        var index = 0
        for i in startRow..<endRow {
            table[i][startCol] = queue[index]
            index += 1
        }
        for i in startCol..<endCol {
            table[endRow][i] = queue[index]
            index += 1
        }
        for i in stride(from: endRow, to: startRow, by: -1) {
            table[i][endCol] = queue[index]
            index += 1
        }
        for i in stride(from: endCol, to: startCol, by: -1) {
            table[startRow][i] = queue[index]
            index += 1
        }

        startRow += 1
        endRow -= 1
        startCol += 1
        endCol -= 1
    }
}

func main() {
    let nmr = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, r) = (nmr[0], nmr[1], nmr[2])
    var table: [[String]] = []
    for _ in 0..<n {
        table.append(readLine()!.split(separator: " ").map { String($0) })
    }

    rotateLayer(&table, 0, n - 1, m - 1, r)

    for row in table {
        print(row.joined(separator: " "))
    }
}

main()