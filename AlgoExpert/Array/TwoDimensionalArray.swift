//
//  TwoDimensionalArray.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 20/01/24.
//

import Foundation

class TwoDimensionalArray {
    
    // Input
//    {
//      "array": [
//        [1, 2, 3, 4],
//        [12, 13, 14, 5],
//        [11, 16, 15, 6],
//        [10, 9, 8, 7]
//      ]
//    }
    // Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    //O(n) time | O(n) space
    func spiralTraverse(array: [[Int]]) -> [Int] {
        if array.isEmpty {
            return []
        }
        var result = [Int]()
        var startRow = 0
        var startCol = 0
        var endRow = array.count - 1
        var endCol = array[0].count - 1
        while startRow <= endRow, startCol <= endCol {
            for col in startCol..<endCol+1 {
                result.append(array[startRow][col])
            }
            
            for row in startRow+1..<endRow+1 {
                result.append(array[row][endCol])
            }
            
            for col in stride(from: endCol-1, through: startCol, by: -1) {
                if startRow == endRow {
                    break
                }
                result.append(array[endRow][col])
            }
            
            for row in stride(from: endRow-1, through: startRow+1, by: -1) {
                if startCol == endCol {
                    break
                }
                result.append(array[row][startCol])
            }
            
            startRow += 1
            startCol += 1
            endRow -= 1
            endCol -= 1
        }
        
        return result
    }
    
}
