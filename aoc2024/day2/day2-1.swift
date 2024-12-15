#!/usr/bin/env swift

import Foundation

var colA = [Int]()
var colB = [Int]()
var distances: [Int] = []

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

            // filter only digits from the line
            var numbers: [Int] = []

            // Get First and Last Digitsj
            numbers = line.split(separator: " ").map { Int($0)! }
            let numA = numbers[0]
            let numB = numbers[1]
            colA.append(numA)
            colB.append(numB)
        }
        colA.sort()
        colB.sort()

    } catch {
        print("Error reading file: \(error.localizedDescription)\n")
    }
}

func processData() -> Int {
    guard colA.count == colB.count else {
        print("Columns are not of the same length")
        return 0
    }

    for i in 0..<colA.count {
        let distance = abs(colA[i] - colB[i])
        distances.append(distance)
    }
    let sum = distances.reduce(0, +)
    return sum
}

// Path to text file
let filePath = "res/input.txt"
// let filePath = "res/sample-input.txt"

// Call the function to read the file
readFile(atPath: filePath)
print(processData())