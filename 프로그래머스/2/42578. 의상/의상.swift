func solution(_ clothes:[[String]]) -> Int {
    var d: [String: Int] = [:]

    for c in clothes {
        d[c[1], default: 0] += 1
    }

    var result = 1
    for c in d.values {
        result *= (c + 1)
    }

    return result - 1
}
