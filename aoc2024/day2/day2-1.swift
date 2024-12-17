#!/usr/bin/env swift

import Foundation

struct Report {
    let levels: [Int]
}


var reports: [Report] = []

// Function to read a text file
func readFile(atPath path: String) {
    do {
        // Read the file contents into a string
        let fileContents = try String(contentsOfFile: path, encoding: .utf8)
        let lines = fileContents.components(separatedBy: .newlines)
        for line in lines {
            // skip empty lines
            guard !line.isEmpty else { continue }
            print("line: \(line)")

            // filter only numbers from the line
            var numbers: [Int] = []

            // Get the numbers from the line
            numbers = line.split(separator: " ").map { Int($0)! }
            reports.append(Report(levels: numbers))
            print(numbers)
        }

    } catch {
        print("Error reading file: \(error.localizedDescription)\n")
    }
}

func isValidSequence(_ levels: [Int]) -> Bool {
    guard levels.count > 1 else { return true }
    
    let differences = zip(levels, levels.dropFirst()).map { $1 - $0 }
    
    let isValidDifference = { (diff: Int) -> Bool in
        abs(diff) >= 1 && abs(diff) <= 3
    }
    
    let isIncreasing = differences.allSatisfy { diff in 
        diff > 0 && isValidDifference(diff)
    }
    
    let isDecreasing = differences.allSatisfy { diff in 
        diff < 0 && isValidDifference(diff)
    }
    
    return isIncreasing || isDecreasing
}

func processData() -> Int {
    var validSequences = 0
    reports.forEach { report in
        if isValidSequence(report.levels) {
            validSequences += 1
            print("Valid sequence: \(report.levels)")
        } else {
            print("Invalid sequence: \(report.levels)")
        }
    }
    return validSequences
}

// Path to text file
let filePath = "res/input.txt"
// let filePath = "res/sample-input.txt"

// Call the function to read the file
readFile(atPath: filePath)
print(processData())