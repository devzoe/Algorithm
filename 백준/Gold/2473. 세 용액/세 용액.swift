import Foundation

func readInput() -> (Int, [Int]) {
    let N = Int(readLine()!)!
    var nums = readLine()!.split(separator: " ").map { Int($0)! }
    nums.sort()
    return (N, nums)
}

func pickThreeSolution(N: Int, nums: [Int]) -> [Int]{
    let maxN = 1000000000
    var result = [Int](repeating: maxN, count: 3)
    for i in 0..<N {
        var start = i+1
        var end = N-1
        while start < end {
            if abs(nums[start]+nums[end]+nums[i]) < abs(result.reduce(0, +)) {
                result = [nums[i], nums[start], nums[end]]
            }
            if nums[start]+nums[end]+nums[i] > 0 {
                end -= 1
            }
            else if nums[start]+nums[end]+nums[i] < 0 {
                start += 1
            }
            else {
                break
            }
        }
    }
    return result
}

let (N, nums) = readInput()
let result = pickThreeSolution(N: N, nums: nums)
result.forEach { i in
    print(i, terminator: " ")
}