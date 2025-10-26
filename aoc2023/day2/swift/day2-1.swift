import Foundation

let redMax = 12
let blueMax = 13
let greenMax = 14
var gameTotal = 0

let fileURL = URL(fileURLWithPath: "../input.txt")

func processLine(line: String) -> Int {
    var localRedMax: Int, localBlueMax: Int, localGreenMax: Int = 0
    let parts = line.split(separator: ": ", maxSplits: 1)
    let gameNumber = Int(parts[0].replacingOccurrences(of: "Game ", with: ""))!
    let results =  parts[1].split(separator: "; ")
    var isValid = false
    for result in results {
        let items = result.split(separator: ", ")
        for item in items {
            let itemParts = item.split(separator: " ")
            let count = Int(itemParts[0])!
            let color = String(itemParts[1])

            if color == "red" {
                if localRedMax > localRedMax {
                    isValid = false
                }
            }
            if color == "blue" {
                if localBlueMax > localBlueMax {
                    isValid = false
                }
                localBlueMax = max(localBlueMax, count)
            }
            if color == "green" {
                if localGreenMax > localGreenMax {
                    isValid = false
                }
            }
        }
    }
    if isValid {
        return gameNumber
    } else {
        return 0
    }   
}

do {
    let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
    let lines = fileContents.split(separator: "\n")
    for line in lines {
        print("*** Line: \(line)")
        gameTotal = processLine(line: String(line))
        // let (gameNumber, colorCounts) = processLine(line: String(line))
        // print("Game number: \(gameNumber)")
        // print("Color counts: \(colorCounts)")
    }
    print("Game total: \(gameTotal)")

} catch {
    print("Error reading file: \(error)")
}