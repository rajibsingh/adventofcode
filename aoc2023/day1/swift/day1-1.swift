import Foundation

let fileURL = URL(fileURLWithPath: "../input.txt")
var total = 0

func processLine(line: String) -> Int {
    var nums:Array<Int> = []
    for character in line {
        if character.isNumber {
            nums.append(Int(String(character))!)
        }
    }
    if nums.count > 2 {
        nums[1] = nums.last!
        nums = Array(nums.prefix(2))
    }
    if nums.count == 1 {
        nums.append(nums[0])
    }
    let retVal = nums[0] * 10 + nums[1]
    return retVal
}

do {
    let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
    let lines = fileContents.split(separator: "\n")
    for line in lines {
        let extractedVal = processLine(line: String(line))
        print(extractedVal)
        total += extractedVal
    }
    print("Total: \(total)")

} catch {
    print("Error reading file: \(error)")
}