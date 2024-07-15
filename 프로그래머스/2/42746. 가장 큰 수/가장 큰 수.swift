import Foundation

func solution(_ numbers:[Int]) -> String {
    let numArr: [Int] = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    if numArr[0] == 0 {
        return "0"
    }
    return numArr.reduce("") { $0 + "\($1)"}
}