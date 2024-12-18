import Foundation

let fileURL = URL(fileURLWithPath: "../input.txt")
var total = 0

func processLine(line: String) -> Int {
    print("***\n" + line)
    var nums:Array<Int> = []
    let numDictionary: [String: String] = ["one": "1", "two": "2", "three": "3", "four": "4", "five": "5",
                                        "six": "6", "seven": "7", "eight": "8", "nine": "9", "zero": "0"]

    var procLine:String = line
    while procLine.count > 0 {
        for word in numDictionary.keys {
            if procLine.hasPrefix(word) {
                nums.append(Int(numDictionary[word]!)!)
            }
        }

        let character = procLine.first!
        if character.isNumber {
            nums.append(Int(String(character))!)
        }

        procLine = String(procLine.dropFirst())
        
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
