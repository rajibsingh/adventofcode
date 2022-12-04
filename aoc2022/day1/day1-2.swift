#!/usr/bin/env swift

import Foundation

do {
    let fileContent = try NSString(contentsOfFile: "input.txt", encoding: String.Encoding.utf8.rawValue)
    let lines = fileContent.components(separatedBy: "\n")
    var runningTotal = 0
    var totals: [Int] = []
    for line in lines {
        if line.count < 1 {
            totals.append(runningTotal)
            runningTotal = 0
        } else {
            let currentVal = Int(line)
            runningTotal = runningTotal + currentVal!
        }
    }
    totals.sort()
    totals.reverse()
    print("totals: \(totals)")
    let total = totals[0] + totals[1] + totals[2]
    print("total: \(total)")
} catch {
    print(error)
}