import Foundation

func readInput() -> ([String], [String], [String], Int, Int) {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let N = line[0], C = line[1]
    let v = ["a", "e", "i", "o", "u"]
    var alphabets: [String] = readLine()!.split(separator: " ").map { String($0) }
    var vowels: [String] = alphabets.filter { v.contains($0) }
    var consonants: [String] = alphabets.filter { !v.contains($0) }
    vowels.sort()
    consonants.sort()
    alphabets.sort()
    return (vowels, consonants, alphabets, N, C)
}

func combinations(_ array: [String], _ k: Int) -> [[String]] {
    var result: [[String]] = []
    func backtrack(_ start: Int, _ ans: inout [String]) {
        if ans.count == k {
            result.append(ans)
            return
        }
        for i in start..<array.count {
            ans.append(array[i])
            backtrack(i + 1, &ans)
            ans.removeLast()
        }
    }
    var ans: [String] = []
    backtrack(0, &ans)
    return result
}

func main() {
    let (vowels, consonants, alphabets, N, C) = readInput()
    let a = combinations(vowels, 1)
    let b = combinations(consonants, 2)
    
    var result = Set<[String]>()
    if N > 3 {
        for i in a {
            for j in b {
                let c: [String] = alphabets.filter { !i.contains($0) && !j.contains($0) }
                //print("\(i) 이고")
                //print("\(j)일 때 ")
                //print(c)
                let r = combinations(c, N-3)
                for k in r {
                    let arr = i + j + k
                    result.insert(arr.sorted())
                }
            }
        }
    } else {
        for i in a {
            for j in b {
                let arr = i + j
                result.insert(arr.sorted())
            }
        }
    }
    
    var answer: [String] = []
    result.forEach { s in
        answer.append(s.joined())
    }
    answer.sort()
    answer.forEach { s in
        print(s)
    }
}
main()