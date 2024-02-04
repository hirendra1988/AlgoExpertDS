//
//  FindSuccessor.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 31/01/24.
//

import Foundation

class FindSuccessor {
    
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        var parent: BinaryTree?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
            parent = nil
        }
    }
    
    func createTree() -> BinaryTree {
        let n1 = BinaryTree(value: 1)
        let n2 = BinaryTree(value: 2)
        let n3 = BinaryTree(value: 3)
        n1.left = n2
        n1.right = n3
        
        let n4 = BinaryTree(value: 4)
        let n5 = BinaryTree(value: 5)
        n2.left = n4
        n2.right = n5
        
        let n6 = BinaryTree(value: 6)
        n4.left = n6
        
        return n1
    }
    
    func findSuccessor(_ tree: BinaryTree, _ node: BinaryTree) -> BinaryTree? {
        var order = [BinaryTree]()
        findSuccessorHelper(tree, order: &order)
        for i in 0..<order.count {
            if order[i].value != node.value {
                continue
            }
            if i == order.count - 1 {
                return nil
            }
            if order[i].value == node.value {
                return order[i+1]
            }
        }
        return nil
    }
    
    func findSuccessorHelper(_ tree: BinaryTree?, order: inout [BinaryTree]) {
        if tree != nil {
            findSuccessorHelper(tree?.left, order: &order)
            order.append(tree!)
            findSuccessorHelper(tree?.right, order: &order)
        }
    }
    
    func findPredecessor(_ tree: BinaryTree, _ node: BinaryTree) -> BinaryTree? {
        var order = [BinaryTree]()
        findSuccessorHelper(tree, order: &order)
        for i in 0..<order.count {
            if order[i].value != node.value || i == 0 {
                continue
            }
            if order[i].value == node.value {
                return order[i-1]
            }
        }
        return nil
    }
}
