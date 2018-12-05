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

var twoCount: Int = 0
var threeCount: Int = 0

for i in input! {

    var charHash : [Character: Int] = [:]

    for (_, char) in i.enumerated() {
        if let count = charHash[char] {
            charHash[char] = count + 1
        } else {
            charHash[char] = 1
        }
    }

    var containsTwo = false
    var containsThree = false

    for (_, val) in charHash {
        if (val == 2) {
            containsTwo = true
        } else if (val == 3) {
            containsThree = true
        }
    }

    if containsTwo { twoCount += 1 }
    if containsThree { threeCount += 1 }

}

print(twoCount*threeCount)

