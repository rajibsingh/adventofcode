import Foundation

var data = try NSString(contentsOfFile: "2018/day1/day1input.txt",
    encoding: String.Encoding.ascii.rawValue)
let inputs = data.components(separatedBy: .newlines)
var total = 0
for i in inputs {
    if i.index[0] == "+" {
        print("plus")
    }
    print(i)
}
