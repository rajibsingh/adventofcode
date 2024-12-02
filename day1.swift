#!/usr/bin/env swift

import Foundation

// Function to read a text file
func readFile(atPath path: String) {
    do {
        // Read the file contents into a string
        let fileContents = try String(contentsOfFile: path, encoding: .utf8)
        print(fileContents) // Print the contents of the file
    } catch {
        print("Error reading file: \(error.localizedDescription)")
    }
}

// Path to your text file
let filePath = "../res/input.txt"

// Call the function to read the file
readFile(atPath: filePath)