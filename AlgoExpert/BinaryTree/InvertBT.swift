//
//  InvertBT.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 27/01/24.
//

import Foundation

class InvertBT {
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
        
        let n8 = BST(data: 8)
        let n9 = BST(data: 9)
        n4.left = n8
        n4.right = n9
        
        let n6 = BST(data: 6)
        let n7 = BST(data: 7)
        n3.left = n6
        n3.right = n7
        
        return n1
    }
    
    func invertBinaryTree(tree: BST?) {
        guard let treeNode = tree else {
            return
        }
        
        var temp = treeNode.left
        treeNode.left = treeNode.right
        treeNode.right = temp
        
        // OR (treeNode.left, treeNode.right) = (treeNode.right, treeNode.left)
        invertBinaryTree(tree: treeNode.left)
        invertBinaryTree(tree: treeNode.right)
    }
    
   
}
