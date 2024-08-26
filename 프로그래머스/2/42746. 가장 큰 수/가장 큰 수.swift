import Foundation

func solution(_ numbers:[Int]) -> String {
    let numArr: [String] = numbers.map { String($0) }.sorted {
        $0 + $1 > $1 + $0
    }
    
    if numArr[0] == "0" {
        return "0"
    }
    
    return numArr.joined()
}
