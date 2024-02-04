//
//  MaxPathSum.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 01/02/24.
//

import Foundation

class MaxPathSum {
    func maxPathSum(tree: BST?) -> Int {
        var maxPath = Int.min
        _ = maxPathSumHelper(tree, &maxPath)
        return maxPath
    }
    
    func maxPathSumHelper(_ tree: BST?, _ maxPath: inout Int) -> Int {
        if tree == nil {
            return -1
        }
        let leftSum = max(maxPathSumHelper(tree?.left, &maxPath), 0) // we compare it with 0 because if its negative then we dont want to add it so we just add 0
        let rightSum = max(maxPathSumHelper(tree?.right, &maxPath), 0)
        maxPath = max(maxPath, leftSum + rightSum + tree!.value)
        return max(leftSum, rightSum) + tree!.value
    }
}
