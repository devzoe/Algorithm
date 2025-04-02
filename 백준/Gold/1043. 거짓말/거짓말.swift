func find(_ x: Int, _ arr: inout [Int]) -> Int{
    if x != arr[x] {
        arr[x] = find(arr[x], &arr)
    }
    return arr[x]
}

func union(_ x: Int, _ y: Int, _ arr: inout [Int]) {
    let x = find(x, &arr)
    let y = find(y, &arr)
    
    if x == y { return }
    if x < y {
        arr[y] = x
    } else {
        arr[x] = y
    }
}

func isUnion(_ x: Int, _ y: Int, _ arr: inout [Int]) -> Bool {
    let x = find(x, &arr)
    let y = find(y, &arr)
    
    if x == y { return true }
    return false
}

func main() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m) = (nm[0],nm[1])
    var parties: [[Int]] = []
    var knowTruth = readLine()!.split(separator: " ").map { Int($0)! }
    knowTruth.removeFirst()
    if knowTruth.count == 0 {
        print(m)
        return
    }
    var people: [Int] = [Int](repeating: 0, count: n+1)
    people.indices.forEach { people[$0] = $0 }
    if knowTruth.count > 1 {
        for i in 1..<knowTruth.count {
            union(knowTruth[0], knowTruth[i], &people)
        }
    }
    for _ in 0..<m {
        var party = readLine()!.split(separator: " ").map { Int($0)! }
        party.removeFirst()
        parties.append(party)
        if party.count == 1 { continue }
        for i in 1..<party.count {
            union(party[0], party[i], &people)
        }
    }

    var result = 0
    for i in 0..<m {
        var isIncluded = false
        for j in parties[i] {
            if isUnion(people[knowTruth[0]], j, &people) {
                isIncluded = true
                break
            }
        }
        if !isIncluded { result += 1 }
    }
    print(result)
}
main()