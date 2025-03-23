func Z(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 { return 0 }
    else {
        return 2*(r%2)+(c%2) + 4*(Z(n-1, r/2, c/2))
    }
}

let t = readLine()!.split(separator: " ").map { Int($0)! }
print(Z(t[0],t[1],t[2]))