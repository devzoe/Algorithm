func solution(_ numbers:[Int], _ target:Int) -> Int {
  var count = 0
  func DFS(index: Int, sum: Int) {
    if index == (numbers.count - 1) && sum == target { 
      count += 1 
      return
    }
    guard index + 1 < numbers.count else { return } 
      
    DFS(index: index+1, sum: sum + numbers[index + 1])
    DFS(index: index+1, sum: sum - numbers[index + 1])
  }
  DFS(index: -1, sum: 0)  
  return count
}