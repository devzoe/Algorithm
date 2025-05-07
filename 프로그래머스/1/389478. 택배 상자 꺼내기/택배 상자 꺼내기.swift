import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    let startDiv = num % w == 0 ? w : num % w
    let startQ = num % w == 0 ? num/w-1 : num/w
    let endQ = n % w == 0 ? n/w-1 : n/w
    let check = startQ % 2
    var answer = 0
    for i in startQ...endQ {
        var div = 0 
        if i%2 == check { div = startDiv }
        else { div = w-startDiv+1 }
        
        let curr = w*i + div
        print(curr)
        if curr > n { break }
        answer += 1
        
    }
    return answer
}