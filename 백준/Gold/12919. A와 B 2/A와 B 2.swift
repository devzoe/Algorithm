let s = readLine()!
let t = readLine()!
var result = 0
func dfs(_ str: String) {
    if result == 1 { return }
    if str.count == s.count {
        if str == s { result = 1 }
        return
    }
    if str[str.index(str.startIndex, offsetBy: str.count-1)] == "A" {
        dfs(String(str[...str.index(str.startIndex, offsetBy: str.count-2)]))
    }
    if str[str.startIndex] == "B" {
        let re = str.reversed()
        dfs(String(re[...re.index(re.startIndex, offsetBy: re.count-2)]))
    }
}
dfs(t)
print(result)