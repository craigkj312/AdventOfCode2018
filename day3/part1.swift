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

struct Fabric {
    var id  = 0
    var top = 0
    var left = 0
    var width = 0
    var height = 0
}

func parseRow(row: String) -> Fabric {
    let nums = row.components(separatedBy: CharacterSet.decimalDigits.inverted)
    return Fabric(id: Int(nums[1])!, top: Int(nums[5])!, left: Int(nums[4])!, width: Int(nums[7])!, height: Int(nums[8])!)
}

func getMaxSizes() -> [Int] {
    var maxWidth = 0
    var maxHeight = 0

    for i in input! {
        let fabric = parseRow(row: i)
        if fabric.left + fabric.width > maxWidth {
            maxWidth = fabric.left + fabric.width
        }
        if fabric.top + fabric.height > maxHeight {
            maxHeight = fabric.top + fabric.height
        }
    }

    return [maxHeight+1, maxWidth+1]
} 

var sizes = getMaxSizes()
var fabricMap: [[Int]] = Array(repeating: Array(repeating: 0, count: sizes[1]), count: sizes[0])

func placeFabric(fabric: Fabric) {

    for i in 0...fabric.height-1 {
        for j in 0...fabric.width-1 {
            fabricMap[fabric.top+i][fabric.left+j] = fabricMap[fabric.top+i][fabric.left+j] + 1
        }
    }

}

for i in input! {
    let fabric = parseRow(row: i)
    placeFabric(fabric: fabric)
}

var overlap = 0

for i in 0...fabricMap.count-1 {
    for j in 0...fabricMap[i].count-1 {
        if fabricMap[i][j] > 1 {
            overlap += 1
        }
    }
}

print(overlap)

