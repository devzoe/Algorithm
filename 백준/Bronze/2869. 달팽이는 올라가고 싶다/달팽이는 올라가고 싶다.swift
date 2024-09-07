import Foundation

let line = readLine()!.split(separator: " ").map{ Int($0)! }
let A = line[0], B = line[1], V = line[2]

if V-A == 0 { print(1) }
else {
    if (V-A) % (A-B) == 0 { print( (V-A) / (A-B) + 1 ) }
    else {  print( (V-A) / (A-B) + 2 ) }
}