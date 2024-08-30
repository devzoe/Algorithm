func solution(_ book_time: [[String]]) -> Int {
    func timeToMinutes(_ time: String) -> Int {
        let components = time.split(separator: ":")
        return Int(components[0])! * 60 + Int(components[1])!
    }
    
    let bookings = book_time.map { booking -> (start: Int, end: Int) in
        (timeToMinutes(booking[0]), timeToMinutes(booking[1]))
    }.sorted { $0.start < $1.start }
    
    var rooms: [Int] = []
    
    for booking in bookings {
        if let availableRoomIndex = rooms.firstIndex(where: { $0 <= booking.start }) {
            rooms[availableRoomIndex] = booking.end + 10
        } else {
            rooms.append(booking.end + 10)
        }
        rooms.sort()
    }
    
    return rooms.count
}