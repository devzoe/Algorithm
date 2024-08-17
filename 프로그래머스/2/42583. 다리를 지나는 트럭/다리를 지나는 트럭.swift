import Foundation

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    var time = 0
    var queue = Array(repeating: 0, count: bridge_length)
    var w = 0 
    var trucks = truck_weights

    while !trucks.isEmpty || w > 0 {
        time += 1 
        w -= queue.removeFirst()
        
        if let nextTruck = trucks.first {
            if w + nextTruck <= weight {
                queue.append(nextTruck)
                w += nextTruck
                trucks.removeFirst()
            } else {
                queue.append(0)
            }
        } else {
            queue.append(0)
        }
    }
    return time
}
