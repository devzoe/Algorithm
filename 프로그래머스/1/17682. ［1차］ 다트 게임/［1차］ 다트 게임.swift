func solution(_ dartResult:String) -> Int {
    let s = Array(dartResult)
    var index: [Int] = []
    var nums: [Int] = []
    var result = 0
    for i in 0..<s.count {
        if let n1 = Int(String(s[i])) {
            if i > 0 && Int(String(s[i-1])) != nil {
                continue
            }
            if let n2 = Int(String(s[i+1])) {
                index.append(i+1)
                nums.append(10)
                continue
            }
            index.append(i)
            nums.append(n1)
        }
    }   
    var stack: [Int] = []
    for (i,ii) in index.enumerated() {
        var cnt = 0
        let n = nums[i]
        switch s[ii+1] {
        case "S":
            cnt += n
        case "D":
            cnt += n*n
        case "T":
            cnt += n*n*n
        default:
            break
        }
        if ii+2 < s.count {
            switch s[ii+2]  {
            case "*":
                cnt *= 2
                if !stack.isEmpty {
                    stack[stack.count-1] *= 2
                }
            case "#":
                cnt = -cnt
            default:
                break
            }
        }
        stack.append(cnt)
    }
    
    return stack.reduce(0,+)
}
