//
//  AddTwoNumbers.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/26/20.
//

import XCTest

/*
 
 https://leetcode.com/problems/add-two-numbers/
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:
 
 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:
 
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 
 */

class AddTwoNumbers: XCTestCase {
    
    func test() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let firstHead243 = ListNode(2)
        let first4 = ListNode(4)
        let first3 = ListNode(3)
        
        firstHead243.next = first4
        first4.next = first3
        
        
        let second5Head564 = ListNode(5)
        let second6 = ListNode(6)
        let second4 = ListNode(4)
        
        second5Head564.next = second6
        second6.next = second4
        
//        addTwoNumbers(firstHead243, second5Head564)
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        
    }
    
//    private func addTwoNumbers(_ l1: ListNode, _ l2: ListNode) -> ListNode? {
//
//        let headReference = ListNode(l1.val + l2.val)
//
//        var finalListNode = headReference
//
//        var carry = 0
//        var firstCurrentNode: ListNode? = l1
//        var secondCurrentNode: ListNode? = l2
//
//        while firstCurrentNode != nil || secondCurrentNode != nil || carry != 0 {
//            defer {}
//
//            if firstCurrentNode != nil || secondCurrentNode != nil {
//                print("-=- other \(firstCurrentNode?.val) \(secondCurrentNode?.val)")
//
//                let summed = ((firstCurrentNode?.val ?? 0) + (secondCurrentNode?.val ?? 0) + carry)
//                let newNodeValue = summed % 10
//                carry = summed / 10
//
//                // create a new node for the new value, and update your counters
//                let newListNode = ListNode(newNodeValue)
//                finalListNode.next = newListNode // TODO: - extension
//                finalListNode = newListNode
//
//                firstCurrentNode = firstCurrentNode?.next
//                secondCurrentNode = secondCurrentNode?.next
//            }
//        }
//
//        return headReference
//    }
    
    private func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        // will return sentinel.next;
        let sentinel = ListNode(0)
        
        var returnNode = sentinel
        
        var carry = 0
        var firstCurrentNode: ListNode? = l1
        var secondCurrentNode: ListNode? = l2
        
        while firstCurrentNode != nil || secondCurrentNode != nil {
            
            if let first = firstCurrentNode {
                
            }
            
            if let second = secondCurrentNode {
                
            }
            
//            if firstCurrentNode != nil || secondCurrentNode != nil {
//                print("-=- other \(firstCurrentNode?.val) \(secondCurrentNode?.val)")
//
//                let summed = ((firstCurrentNode?.val ?? 0) + (secondCurrentNode?.val ?? 0) + carry)
//                let newNodeValue = summed % 10
//                carry = summed / 10
//
//                print("-=- meta \(newNodeValue) \(carry)")
//
//                // create a new node for the new value, and update your counters
//                let newListNode = ListNode(newNodeValue)
//                returnNode.next = newListNode // TODO: - extension
//                returnNode = newListNode
//
//                firstCurrentNode = firstCurrentNode?.next
//                secondCurrentNode = secondCurrentNode?.next
//            }
        }
        
        return sentinel.next
    }
}
