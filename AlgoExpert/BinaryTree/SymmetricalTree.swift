//
//  SymmetricalTree.swift
//  AlgoExpert
//
//  Created by Hirendra Sharma on 01/02/24.
//

import Foundation
class SymmetricalTree {

    func symmetricalTree(_ tree: BST) -> Bool {
        return symmetricalTreeHelper(tree, tree)
    }

    func symmetricalTreeHelper(_ tree1: BST?, _ tree2: BST?) -> Bool {
        if tree1 == nil && tree2 == nil {
            return true
        }
        if tree1?.value != tree2?.value {
            return false
        }
        return symmetricalTreeHelper(tree1?.left, tree2?.right) && symmetricalTreeHelper(tree1?.right, tree2?.left)
    }
}
