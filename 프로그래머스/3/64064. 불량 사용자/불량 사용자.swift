import Foundation

// 문자열 접근
extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}
//조합
func combination(_ input: [[String]]) -> Set<[String]> {
    var result = Set<[String]>() // 중복 방지

    func backtrack(_ index: Int, _ currentCombination: [String], _ visited: inout Set<String>) {
        if index == input.count {
            result.insert(currentCombination.sorted()) // 순서 무시
            return
        }

        for student in input[index] {
            if !visited.contains(student) {
                visited.insert(student)  //방문
                backtrack(index + 1, currentCombination + [student], &visited)
                visited.remove(student)
            }
        }
    }

    var visited = Set<String>()
    backtrack(0, [], &visited)
    
    return result
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var banned: [[String]] = [[String]](repeating:[],count:banned_id.count)
    for (index, b) in banned_id.enumerated() {
        for u in user_id {
            if b.count == u.count {
                var flag = true
                for i in 0..<b.count{
                    if b[i] != u[i] && b[i] != "*" {
                        flag = false
                        break
                    }
                }
                if flag {
                    banned[index].append(u)
                }
            }
        }
    }
    return combination(banned).count
}