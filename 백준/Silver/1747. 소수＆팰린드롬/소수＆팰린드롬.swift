import Foundation 

func main() {
    let n = Int(readLine()!)!
    if [1,2].contains(n) {
        print(2)
        return
    }
    let maxN = 1100000
    var result = 0
    loop: for i in n...maxN {
        if i % 2 == 0 { continue }
        for j in stride(from: 3, through: Int(sqrt(Double(i))), by: 2) {
            if i%j == 0 {
                continue loop
            }
        }
        let reverse = String(i).reversed()
        if String(reverse) == String(i) {
            result = i
            break
        }
    }
    print(result)
}
main()