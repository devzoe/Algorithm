func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {    
    var result : [[String]] = Array(repeating:Array(repeating:"#",count:n),count:n)
    var answer : [String] = []

    for i in 0..<n{
        let a = binary(n,arr1[i])
        let b = binary(n,arr2[i])
        for j in 0..<n {
            if a[j] == 0 && b[j] == 0 {
               result[i][j] = " "
            }
        }
    }
    
    result.forEach {
        answer.append($0.reduce("" , +))
    }
    return answer
}
func binary(_ cnt : Int, _ n :Int) -> [Int] {
    guard n != 0 else { return Array(repeating: 0, count: cnt) }
    var num = n
    var result : [Int] = []
    while num != 0 {
        result.insert(num % 2,at:0)
        num /= 2
    }
    if result.count < cnt {
        while result.count < cnt {
            result.insert(0, at:0)
        }
    }
    return result
}