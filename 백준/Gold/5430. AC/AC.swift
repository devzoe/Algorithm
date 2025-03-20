import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let f = readLine()!.map { String($0) }
    let n = Int(readLine()!)!
    var s = readLine()!.replacingOccurrences(of: "[", with: "")
    s = s.replacingOccurrences(of: "]", with: "")
    var arr = s.split(separator: ",").map { Int($0)! }
    var rCnt = 0
    var dLcnt = 0
    var dRcnt = 0
    var toggle = true
    for i in f {
        switch i {
        case "R":
            rCnt += 1
            toggle.toggle()
        case "D":
            if toggle {
                dLcnt += 1
            } else {
                dRcnt += 1
            }
        default:
            print("")
        }
    }
    if dLcnt+dRcnt > n { print("error") }
    else {
        if rCnt % 2 == 1 {
            arr.reverse()
            (dLcnt,dRcnt) = (dRcnt,dLcnt)
        }
        let newArr = arr[dLcnt..<arr.count-dRcnt]
        let len = newArr.count-1
        var result = "["
        for (i,num) in newArr.enumerated() {
            result += String(num)
            if i < len { result += ","}
        }
        result += "]"
        print(result)
    }
}