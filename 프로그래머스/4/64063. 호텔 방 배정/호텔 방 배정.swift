import Foundation

func findRoom(_ emp: inout [Int64: Int64], _ roomNumber: Int64) -> Int64 {
    if emp[roomNumber] == nil {
        emp[roomNumber] = roomNumber + 1
        return roomNumber
    }
    
    let next = findRoom(&emp,emp[roomNumber]!)
    emp[roomNumber] = next
    
    return next
}

func solution(_ k: Int64, _ room_number: [Int64]) -> [Int64] {   
    var emp = [Int64: Int64]()
    var answer = [Int64]()

    for r in room_number {
        let room = findRoom(&emp,r)
        answer.append(room)
    }

    return answer
}