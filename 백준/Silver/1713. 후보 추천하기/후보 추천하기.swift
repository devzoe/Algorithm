import Foundation

func readInput() -> (Int, Int, [Int]) {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var numbers = readLine()!.split(separator: " ").map { Int($0)! }
    return (n, m, numbers)
}

func containsAndIncrement(key: Int, in array: inout [(Int, Int)]) -> Bool {
    for i in 0..<array.count {
        if array[i].0 == key {
            array[i].1 += 1
            return true
        }
    }
    return false
}

func addElement(x: Int, to array: inout [(Int, Int)], with maxSize: Int) {
    if array.count < maxSize {
        array.append((x, 1))
    } else {
        if let minIndex = array.enumerated().min(by: { $0.element.1 < $1.element.1 })?.offset {
            array.remove(at: minIndex)
            array.append((x, 1))
        }
    }
}

func processElements(n: Int, m: Int, elements: [Int]) -> [(Int, Int)] {
    var array = [(Int, Int)]()
    for x in elements {
        if !containsAndIncrement(key: x, in: &array) {
            addElement(x: x, to: &array, with: n)
        }
    }
    return array
}

func main() {
    let (n, m, elements) = readInput()
    var array = processElements(n: n, m: m, elements: elements)
    array.sort(by: { $0.0 < $1.0 })
    
    for element in array {
        print(element.0, terminator: " ")
    }
    print()
}

main()