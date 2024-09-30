import Foundation

var N = 0
var M = 0
var pos: [Int] = []

func check(_ height: Int) -> Bool {
    var position = 0

    for curr in pos {
        let leftLight = curr - height
        let rightLight = curr + height

        if position < leftLight {
            return false
        }

        position = rightLight
    }

    return position >= N
}

func main() {
    N = Int(readLine()!)!
    M = Int(readLine()!)!
    
    pos = readLine()!.split(separator: " ").map { Int($0)! }
    
    var start = 0
    var end = N
    
    while start < end {
        let mid = (start + end) / 2
        
        if check(mid) {
            end = mid
        } else {
            start = mid + 1
        }
    }
    
    print(start)
    
}

main()
