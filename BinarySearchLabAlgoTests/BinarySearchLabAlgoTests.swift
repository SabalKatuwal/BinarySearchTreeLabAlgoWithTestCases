//
//  BinarySearchLabAlgoTests.swift
//  BinarySearchLabAlgoTests
//
//  Created by Sabal on 5/2/23.
//

import XCTest
@testable import BinarySearchLabAlgo

final class BinarySearchLabAlgoTests: XCTestCase {
    var bst: BinarySearchTree!
    
    override func setUp(){
        super.setUp()   //ensure that default setup of the parentClass is also executed.
        bst = BinarySearchTree()
        setUpThis()
    }
    
    func setUpThis(){
        /*
        Executed before each test method.
        Before each test method, create a BST with some fixed key-values.
        */
//        let bst = BinarySearchTree()
        bst.add(key: 10, value: "Value for 10")
        bst.add(key: 52, value: "Value for 52")
        bst.add(key: 5, value: "Value for 5")
        bst.add(key: 8, value: "Value for 8")
        bst.add(key: 1, value: "Value for 1")
        bst.add(key: 40, value: "Value for 40")
        bst.add(key: 30, value: "Value for 30")
        bst.add(key: 45, value: "Value for 45")
       
    }
    
    func test_add(){
        // Create an instance of BinarySearchTree
        let bsTree = BinarySearchTree()
        // bsTree must be empty
        XCTAssertEqual(bsTree.size(), 0)
        // Add a key-value pair
        bsTree.add(key: 15, value: "Value for 15")
        // Size of bsTree must be 1
        XCTAssertEqual(bsTree.size(), 1)
        // Add another key-value pair
        bsTree.add(key: 10, value: "Value for 10")
        // Size of bsTree must be 2
        XCTAssertEqual(bsTree.size(), 2)
        
        // The added keys must exist.
        XCTAssertEqual(bsTree.search(key: 10) as? String, "Value for 10")
        XCTAssertEqual(bsTree.search(key: 15) as? String, "Value for 15")
        
    }
    
    func test_search(){
//        tests for search
//        let bst = BinarySearchTree()
        let actual_output = bst.search(key: 40)
        let expected_output = "Value for 40"
        XCTAssertEqual(actual_output as? String, expected_output)

        XCTAssertFalse(bst.search(key: 90) != nil)

        bst.add(key: 90, value: "Value for 90")
        XCTAssertEqual(bst.search(key: 90) as? String, "Value for 90")

    }
    
    func test_inorder(){
//        tests for inorder_walk
        let actual_output = self.bst.inorder_walk()
        let expected_output = [1, 5, 8, 10, 30, 40, 45, 52]

        XCTAssertEqual(actual_output, expected_output)

//        # Add one node
        bst.add(key: 25, value: "Value for 25")
//        # Inorder traversal must return a different sequence
        XCTAssertEqual(bst.inorder_walk(), [1, 5, 8, 10, 25, 30, 40, 45, 52])
    }
        
            
    
    
    func test_postorder(){
//        tests for postorder_walk
        let actual_output = self.bst.postorder_walk()
        let expected_output = [1, 8, 5, 30, 45, 40, 52, 10]
        
        XCTAssertEqual(actual_output, expected_output)

//        Add one node
        bst.add(key: 25, value: "Value for 25")
//        Postorder traversal must return a different sequence
        XCTAssertEqual(bst.postorder_walk(), [1, 8, 5, 25, 30, 45, 40, 52, 10])
    }
    
    func test_preorder(){
//        tests for preorder_walk
        
        XCTAssertEqual(bst.preorder_walk(), [10, 5, 1, 8, 52, 40, 30, 45])

//        Add one node
        bst.add(key: 25, value: "Value for 25")
//        Preorder traversal must return a different sequence
        XCTAssertEqual(bst.preorder_walk(), [10, 5, 1, 8, 52, 40, 30, 25, 45])
    }
      

    func test_remove(){
//        tests for remove
        bst.remove(key: 40)

        
        XCTAssertEqual(bst.size(), 7)
        XCTAssertEqual(bst.inorder_walk(), [1, 5, 8, 10, 30, 45, 52])
        XCTAssertEqual(bst.preorder_walk(), [10, 5, 1, 8, 52, 30, 45])
        
        //test case to delete root
        bst.remove(key: 10)
        XCTAssertEqual(bst.size(), 6)
        XCTAssertEqual(bst.inorder_walk(), [1, 5, 8, 30, 45, 52])
        XCTAssertEqual(bst.preorder_walk(), [8, 5, 1, 52, 30, 45])
        XCTAssertEqual(bst.postorder_walk(), [1, 5, 45, 30, 52, 8])
    }
    
    
    func test_smallest(){
//        tests for smallest
        //since swift doesnot have assertupleEqual function so key and value is tested separately
       
        let (smallestKey , smallestValue) = bst.smallest()
        XCTAssertEqual(smallestKey, 1)
        XCTAssertEqual(smallestValue , "Value for 1")
       
//        # Add some nodes
        bst.add(key: 6, value: "Value for 6")
        bst.add(key: 4,value: "Value for 4")
        bst.add(key: 0,value: "Value for 0")
        bst.add(key: 32, value: "Value for 32")

//        # Now the smallest key is 0.
        let (sKey , sValue) = bst.smallest()
        XCTAssertEqual(sKey, 0)
        XCTAssertEqual(sValue , "Value for 0")
    }
    
    func test_largest(){
//        tests for largest
        let (largestKey, largestValue) = bst.largest()
        XCTAssertEqual(largestKey, 52)
        XCTAssertEqual(largestValue, "Value for 52")

//        # Add some nodes
        bst.add(key: 6,value: "Value for 6")
        bst.add(key: 54,value: "Value for 54")
        bst.add(key: 0, value: "Value for 0")
        bst.add(key: 32, value: "Value for 32")

//        # Now the largest key is 54
        let (lKey, lValue) = bst.largest()
        XCTAssertEqual(lKey, 54)
        XCTAssertEqual(lValue, "Value for 54")
        
        bst.add(key: 60, value: "Value for 60")
        //Now the largest key is 60
        let (laKey, laValue) = bst.largest()
        XCTAssertEqual(laKey, 60)
        XCTAssertEqual(laValue, "Value for 60")
    }
          
}
