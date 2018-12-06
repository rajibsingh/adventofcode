import Foundation

var data = try NSString(contentsOfFile: "2018/day1/day1input.txt", encoding: String.Encoding.ascii.rawValue)
let deltas = data.components(separatedBy: .newlines)

var frequencies: Set = [0] 
var total = 0
for delta in deltas {
    let delta = Int(delta)!
    total = total + delta 
    frequencies.insert(total) 
}
print(frequencies)
var i = 0
var keep_running = true 
while keep_running {
    deltas.insert(delta)
    // print(delta)
    // keep_running = false 
// }
