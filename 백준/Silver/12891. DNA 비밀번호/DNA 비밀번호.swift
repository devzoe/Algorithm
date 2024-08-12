func findValidPasswords(dnaLength: Int, passwordLength: Int, dnaSequence: [String], minimumCounts: [Int]) -> Int {
    var a: Int = 0
    var c: Int = 0
    var g: Int = 0
    var t: Int = 0

    var answer: Int = 0

    func plus(_ str: String) {
        if str == "A" {
            a += 1
        }
        if str == "C" {
            c += 1
        }
        if str == "G" {
            g += 1
        }
        if str == "T" {
            t += 1
        }
    }

    func minus(_ str: String) {
        if str == "A" {
            a -= 1
        }
        if str == "C" {
            c -= 1
        }
        if str == "G" {
            g -= 1
        }
        if str == "T" {
            t -= 1
        }
    }

    func check() {
        if a >= minimumCounts[0] &&
            c >= minimumCounts[1] &&
            g >= minimumCounts[2] &&
            t >= minimumCounts[3] {
            answer += 1
        }
    }

    for i in 0..<passwordLength {
        plus(dnaSequence[i])
    }

    check()

    for i in 0..<dnaLength - passwordLength {
        minus(dnaSequence[i])
        plus(dnaSequence[i + passwordLength])
        check()
    }

    return answer
}

let sp: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }
let s: Int = sp[0]
let p: Int = sp[1]
let dna: [String] = readLine()!.map { String($0) }
let min: [Int] = readLine()!.split(separator: " ").map { Int($0) ?? 0 }

let result = findValidPasswords(dnaLength: s, passwordLength: p, dnaSequence: dna, minimumCounts: min)
print(result)
