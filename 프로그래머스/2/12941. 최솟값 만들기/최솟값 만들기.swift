func solution(_ A:[Int], _ B:[Int]) -> Int {
    var result = 0

    var temp1 = A.sorted{$0>$1}
    var temp2 = B.sorted{$0<$1}
    
    for i in 0..<A.count {
        result += temp1[i] * temp2[i]
    }
    
    return result
}