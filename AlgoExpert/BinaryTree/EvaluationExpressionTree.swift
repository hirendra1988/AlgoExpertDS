//
//  EvaluationExpressionTree.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 26/01/24.
//

import Foundation

class EvaluationExpressionTree {
    func createTree() -> BST {
        let n1 = BST(data: -1)
        let n2 = BST(data: -2)
        let n3 = BST(data: -3)
        
        n1.left = n2
        n1.right = n3
        
        let n4 = BST(data: -4)
        let n5 = BST(data: 2)
        
        n2.left = n4
        n2.right = n5
        
        let n6 = BST(data: 8)
        let n7 = BST(data: 3)
        
        n3.left = n6
        n3.right = n7
        
        let n8 = BST(data: 2)
        let n9 = BST(data: 3)
        
        n4.left = n8
        n4.right = n9
        
        return n1
    }
    
    func evaluationTree(root: BST) -> Int {
        return evaluationTreeHelper(root: root)
    }
    
    func evaluationTreeHelper(root: BST) -> Int {
        switch root.value {
        case -1:
            return evaluationTreeHelper(root: root.left!) + evaluationTreeHelper(root: root.right!)
        case -2:
            return evaluationTreeHelper(root: root.left!) - evaluationTreeHelper(root: root.right!)
        case -3:
            return evaluationTreeHelper(root: root.left!) / evaluationTreeHelper(root: root.right!)
        case -4:
            return evaluationTreeHelper(root: root.left!) * evaluationTreeHelper(root: root.right!)
        default:
            return root.value
        }
    }
}
