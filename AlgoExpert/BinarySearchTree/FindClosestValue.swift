//
//  FindClosestValue.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 04/02/24.
//

import Foundation

class FindClosestValue {
    class BST {
        var left: BST?
        var right: BST?
        var value: Int
        
        init(value: Int) {
            self.value = value
        }
    }
    
    func createBST() -> BST {
        let n10 = BST(value: 10)
        let n5 = BST(value: 5)
        let n15 = BST(value: 15)
        
        n10.left = n5
        n10.right = n15
        
        let n2 = BST(value: 2)
        let n55 = BST(value: 5)
        n5.left = n2
        n5.right = n55
        
        let n1 = BST(value: 1)
        n2.left = n1
        
        let n13 = BST(value: 13)
        let n22 = BST(value: 22)
        
        n15.left = n13
        n15.right = n22
        
        let n14 = BST(value: 14)
        n13.right = n14
        
        return n10
    }
    
    func findClosestValueInBST(tree: BST?, target: Int) -> Int {
        var closest = tree!.value
        _ = findClosestValueInBSTHelper(tree: tree, target: target, closest: &closest)
        return closest
    }
    
    func findClosestValueInBSTHelper(tree: BST?, target: Int, closest: inout Int) -> Int {
        if tree == nil {
            return closest
        }
        
        if abs(target - closest) > abs(target - tree!.value) {
            closest = tree!.value
        }
        
        if target < tree!.value {
            return findClosestValueInBSTHelper(tree: tree?.left, target: target, closest: &closest)
        }
        if target > tree!.value {
            return findClosestValueInBSTHelper(tree: tree?.right, target: target, closest: &closest)
        }
        return closest
    }

    func testMethod() {
        let bst =  FindClosestValue()
        var rootnode = bst.createBST()
        var target = 12
        print(bst.findClosestValueInBST(tree: rootnode, target: target))
    }
    
    func newMethod() {
        
    }
}
