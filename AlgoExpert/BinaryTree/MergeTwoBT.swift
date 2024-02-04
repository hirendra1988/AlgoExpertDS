//
//  MergeTwoBT.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 01/02/24.
//

import Foundation

class MergeTwoBT {

    func mergeBinaryTrees(_ tree1: BST?, _ tree2: BST?) -> BST? {
       if tree1 == nil {
         return tree2
       }
       if tree2 == nil {
         return tree1
       }

       tree1!.value += tree2!.value
       tree1?.left = mergeBinaryTrees(tree1?.left, tree2?.left)
       tree1?.right = mergeBinaryTrees(tree1?.right, tree2?.right)
       
       return tree1
     }
}
