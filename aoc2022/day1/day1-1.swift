#!/usr/bin/env swift
import Foundation

let filePath = "../input.txt"
let fullPath = NSString(string: filePath).expandingTildeInPath
 do
 {
    let fileContent = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)
    print(fileContent)
    let lines = fileContent.components(separatedBy:"\n")
    var runningTotal = 0
    var highestTotal = 0
    for line in lines {
        print(line)
        if line.count < 1 {
            print("empty line!")
        } else {

        }
    }
 }
 catch
 {
     print(error)
 }