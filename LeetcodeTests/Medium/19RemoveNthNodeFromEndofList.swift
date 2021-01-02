//
//  19RemoveNthNodeFromEndofList.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/1/21.
//

import XCTest

class RemoveNthNodeFromEndofList: XCTestCase {

    /*
     Given the head of a linked list, remove the nth node from the end of the list and return its head.

     Follow up: Could you do this in one pass?


     Example 1:


     Input: head = [1,2,3,4,5], n = 2
     Output: [1,2,3,5]
     Example 2:

     Input: head = [1], n = 1
     Output: []
     Example 3:

     Input: head = [1,2], n = 1
     Output: [1]
     
     */

    func test() {
        
        let head = ListNode(1)
        let second = ListNode(2)
//        let third = ListNode(3)
//        let fourth = ListNode(4)
//        let fifth = ListNode(5)

        
        head.next = second
//        second.next = third
//        third.next = fourth
//        fourth.next = fifth

        removeNthFromEnd(head,2)
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var nodeCounter: ListNode? = head
        var accumulatedNodes: [ListNode] = []
        
        while let currentNode = nodeCounter {
            accumulatedNodes.append(currentNode)
            nodeCounter = currentNode.next
        }
        

        guard accumulatedNodes.count > 1 else {
            return nil
        }
        
        let deletionNodeIndex = accumulatedNodes.count - n
        let deletionNode = accumulatedNodes[deletionNodeIndex]
        
        // we want to change the head
        if deletionNodeIndex == 0 {
            return head?.next
        } else if deletionNodeIndex < 0 {
            return nil
        } else
        {
            let deletionNodeParent = accumulatedNodes[deletionNodeIndex-1]
            
            deletionNodeParent.next = deletionNode.next
            
        }
        
        return head
    }
    
    class ListNode {
        let val: Int
        var next: ListNode?

        init(_ val: Int = 0, _ next: ListNode? = nil) {
            self.val = val
            self.next = next
        }
    }
}
