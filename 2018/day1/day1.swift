import Foundation

var data = try NSString(contentsOfFile: "2018/day1/day1input.txt",
    encoding: String.Encoding.ascii.rawValue)
let inputs = data.components(separatedBy: .newlines)
var total = 0
for i in inputs {
    print(i)
    let number = Int(i)
    total = total + number!
}
print(total)
