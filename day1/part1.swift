#!/usr/bin/swift

import Foundation 

func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
    do {
        let content = try String(contentsOfFile:fileName, encoding: String.Encoding.utf8)
        return content.components(separatedBy: "\n")
    } catch {
        return nil
    }
}

let input = arrayFromContentsOfFileWithName(fileName: "input.txt")

var value = 0 as Int
for i in input! {
    
    if let val = Int(i) {
        value += val
    } else {
        print("FAILED TO CONVERT \(i) TO INT")
    }

}

print(value)

