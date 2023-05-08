//
//  bst.swift
//  BinarySearchLabAlgo
//
//  Created by Sabal on 5/2/23.
//

import Foundation

class Node {
    var key: Int
    var value: String
    var left: Node?
    var right: Node?
    
    init(key: Int, value: String) {
        self.key = key
        self.value = value
    }
}
public class BinarySearchTree{
    private var root: Node?
    
    public func add(key: Int, value: String){
        let newNode = Node(key: key, value: value)
        //if there is root
        if let root = root {
            addHelper(root, newNode)
        }else{
            root = newNode
        }
    }
    
    private func addHelper(_ node: Node,_ newNode: Node){
        if newNode.key > node.key{
            //check if right child exists or not
            if let right = node.right{
                //if right child exist recurisvely call insertHelper func
                addHelper(right, newNode)
            }else{
                //if no right child then insert the node
                node.right = newNode
            }
            
        }else if newNode.key < node.key{
            if let left = node.left{
                addHelper(left, newNode)
            }else{
                node.left = newNode
            }
            
        }else{
            //if the node already exists update the value of that key
            node.value = newNode.value
        }
    }
    
    
    func size()-> Int {
        return sizeHelper(root)
    }
    private func sizeHelper(_ node: Node?)-> Int{
        guard let node = node else { return 0 }
        return (1 + sizeHelper(node.left) + sizeHelper(node.right))
    }
    
    
    func search(key: Int) -> Any? {
        var current = root
        //loop runs until the end of node or until it returns nil
        while let node = current {
            if node.key == key {
                return node.value
            }else if key > node.key{
                current = node.right
            }else{
                current = node.left
            }
        }
        return nil
    }
    
    
    func inorder_walk() -> [Int]{
        var result = [Int]()
        inorderHelper(root, &result)
        return result
    }
    private func inorderHelper(_ node: Node?, _ result: inout [Int]){
        guard let node = node else { return }
        inorderHelper(node.left, &result)
        result.append(node.key) //inorder so store here
        inorderHelper(node.right, &result)
    }
    
    
    func preorder_walk() -> [Int]{
        var result = [Int]()
        preorderHelper(root, &result)
        return result
    }
    private func preorderHelper(_ node: Node?,_ result: inout [Int]) {
        guard let node = node else { return }
        result.append(node.key)
        preorderHelper(node.left, &result)
        preorderHelper(node.right, &result)
    }
    
    
    func postorder_walk() -> [Int]{
        var result = [Int]()
        postorderHelper(root, &result)
        return result
    }
    private func postorderHelper(_ node: Node?, _ result: inout [Int]){
        guard let node = node else { return }
        postorderHelper(node.left, &result)
        postorderHelper(node.right, &result)
        result.append(node.key)
    }
    
    
    func remove(key: Int) {
        root = removeHelper(root, key)
    }

    private func removeHelper(_ node: Node?, _ key: Int) -> Node? {
        guard let node = node else { return nil }
        
        if key < node.key {
            node.left = removeHelper(node.left, key)
        } else if key > node.key {
            node.right = removeHelper(node.right, key)
        } else {
            if node.left == nil && node.right == nil {
                // when node has no children
                return nil
            } else if node.left == nil {
                // When node has one right child
                return node.right
            } else if node.right == nil {
                // when node has one left child
                return node.left
            } else {
                // when node has two children
                let successor = findMin(node.left!) //finds maximum key on left subtree
                node.key = successor.key
                node.value = successor.value
                node.left = removeHelper(node.left, successor.key)
            }
        }
        
        return node
    }

    private func findMin(_ node: Node) -> Node {
        var current = node
        //maximum key is on rightmost leaf
        while let right = current.right {
            current = right
        }
        return current
    }
    
    
    func smallest() -> (Int, String) {
        guard let root = root else {
            //returns -1 if key is empty
            return (-1, "No node inserted")
        }
        //finds the leftmost node(having smallest key) and store in current
        var current = root
        while let left = current.left{
            current = left
        }
        //if there is only one node i.e. only root
        if current === root && current.left == nil {
            //`===` is the identity operator, which checks if two objects or references refer to the same instance. It returns true if both references point to the same object, and false otherwise.
            return (current.key, current.value)
        }
        return (current.key, current.value)
    }
    
    func largest() -> (Int, String) {
        guard let root = root else {
            //returns -1 if key is empty
            return (-1, "No node inserted")
        }
        //finds the rightmost node(having largest key) and store in current
        var current = root
        while let right = current.right{
            current = right
        }
        //if there is only one node i.e. only root
        if current === root && current.right == nil && current.left == nil {
            //`===` is the identity operator, which checks if two objects or references refer to the same instance. It returns true if both references point to the same object, and false otherwise.
            return (current.key, current.value)
        }
        return (current.key, current.value)
    }
}




