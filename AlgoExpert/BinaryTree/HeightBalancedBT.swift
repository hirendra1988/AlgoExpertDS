//
//  HeightBalancedBT.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 01/02/24.
//

import Foundation

class HeightBalancedBT {
    func createTree() -> BST {
        let n1 = BST(data: 1)
        let n2 = BST(data: 2)
        let n3 = BST(data: 3)
        
        n1.left = n2
        n1.right = n3
        
        let n4 = BST(data: 4)
        let n5 = BST(data: 5)
        n2.left = n4
        n2.right = n5
        
        let n7 = BST(data: 7)
        let n8 = BST(data: 8)
        
        n5.left = n7
        n5.right = n8
        
        let n6 = BST(data: 6)
        n3.right = n6
        
        return n1
    }
    
    func heightBalancedBinaryTree(_ tree: BST) -> Bool {
        var isBalancedTree = true
        _ = heightOfTree(tree: tree, isBalancedTree: &isBalancedTree)
        return isBalancedTree
    }
    
    func heightOfTree(tree: BST?, isBalancedTree: inout Bool) -> Int {
        if tree != nil {
            let left = heightOfTree(tree: tree?.left, isBalancedTree: &isBalancedTree)
            let right = heightOfTree(tree: tree?.right, isBalancedTree: &isBalancedTree)
            if abs(left - right) > 1 {
                isBalancedTree = false
            }
            return max(left, right) + 1
        }
        return -1
    }
}
