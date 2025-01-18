func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 {
        return 5*cities.count
    }
    var queue: [String] = []
    var result = 0
    for city in cities {
        let c = city.uppercased()
        if queue.contains(c) {
            result += 1
            let i = queue.firstIndex(of:c)!
            queue.remove(at:i)
        } else {
            result += 5
            if queue.count == cacheSize {
                queue.removeFirst()
            }
        }
        queue.append(c)
    }  
    return result
}