import Foundation

func solution(_ s:String) -> Int {
    var result = s
    let word = ["zero":"0","one":"1","two":"2","three":"3","four":"4","five":"5","six":"6","seven":"7","eight":"8","nine":"9"]
    word.forEach {
        if result.contains($0.key) { 
            result = result.replacingOccurrences(of:$0.key,with:$0.value)
        }
    }
    
    return Int(result)!
}