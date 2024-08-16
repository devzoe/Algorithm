func solution(_ enroll: [String], _ referral: [String], _ seller: [String], _ amount: [Int]) -> [Int] {
    var dic: [String: String] = [:]
    var income: [String: Int] = [:]
    var answer: [Int] = []

    for (i, e) in enroll.enumerated() {
        dic[e] = referral[i]
    }

    for (i, s) in seller.enumerated() {
        var a = amount[i] * 100
        var current = s
        
        while a > 0 && current != "-" {
            let tenAmount = a / 10
            let newAmount = a - tenAmount
            income[current, default: 0] += newAmount
            a = tenAmount
            current = dic[current] ?? "-"
        }
    }

    for e in enroll {
        answer.append(income[e, default: 0])
    }

    return answer
}
