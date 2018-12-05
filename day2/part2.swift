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

func compareStrings(first: String, second: String) -> [Int] {

    var different: [Int] = []
    
    if (first.count != second.count) {
        return []
    }

    for i in 0...first.count-1 {
        let index = first.index(first.startIndex, offsetBy: i)
        if (first[index] != second[index]) {
            different.append(i)
        }
    }

    return different
}

func printSolution(str: String, index: Int) {
    print("\(str) \(index)")
    let solution = str.prefix(index) + str.suffix(str.count-index-1)
    print(solution)
    exit(0)
}

for (i, str) in input!.enumerated() {

    for index in i+1...input!.count-1 {
        let comp = compareStrings(first: str, second: input![index])
        if(comp.count == 1) {
            printSolution(str: str, index: comp[0])
        }
    } 

}

