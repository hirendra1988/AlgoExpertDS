//
//  BranchSums.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 22/01/24.
//

import Foundation

class BST {
    var left: BST?
    var right: BST?
    var value: Int
    init(left: BST? = nil, right: BST? = nil, data: Int) {
        self.left = left
        self.right = right
        self.value = data
    }
}

class BranchSums {
    
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
        
        let n10 = BST(data: 10)
        n5.left = n10
        
        let n6 = BST(data: 6)
        let n7 = BST(data: 7)
        n3.left = n6
        n3.right = n7
        
        return n1
    }
    
    func branchSum(root: BST) -> [Int] {
        var result = [Int]()
        branchSumsHelper(root: root, sum: root.value, result: &result)
        return result
    }
    
    func branchSumsHelper(root: BST, sum: Int, result: inout [Int]) {
        if root.left == nil && root.right == nil {
            result.append(sum)
        }
        
        if root.left != nil {
            branchSumsHelper(root: root.left!, sum: sum + root.left!.value, result: &result)
        }
        
        if root.right != nil {
            branchSumsHelper(root: root.right!, sum: sum + root.right!.value, result: &result)
        }
    }
    
}

