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
var values = [0] as [Int]

while (true) {
    for i in input! {
        
        if let val = Int(i) {
            value += val
            if  values.contains(value)  {
                print(value)
                exit(0)
            } else {
                values.append(value)
            }
        } else {
            print("FAILED TO CONVERT \(i) TO INT")
        }

    }
    print("NO REPEAT")
}

