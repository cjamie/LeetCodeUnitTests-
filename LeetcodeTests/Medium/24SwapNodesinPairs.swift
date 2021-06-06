//
//  24SwapNodesinPairs.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/3/21.
//

import XCTest

class SwapNodesinPairs: XCTestCase {

    func test() {
        
        let firstList = ListNode(1)
        let two = ListNode(2)
        let three = ListNode(3)
        let four = ListNode(4)

        firstList.next = two
        two.next = three
        three.next = four
        
        swapPairs(firstList)
        
    }
    
    
    // TODO: - fix
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var odd: [ListNode] = []

        var even: [ListNode] = []

        
        var nodeCounter = head
        var isEven = true

        while let currentNode = nodeCounter {
            
            isEven
                ? even.append(currentNode)
                : odd.append(currentNode)
            
            // this moves up the node counter up

            let nextNode = currentNode.next
            currentNode.next = nextNode
            nodeCounter = nextNode
            isEven.toggle()
        }
        
        let oddCount = odd.count
        
        odd.enumerated().forEach { index, current in
            current.next = even[index]
            
        }
        
        even.enumerated().forEach { index, current in
            let assignmentIndex = index + 1
            if assignmentIndex < oddCount {
                current.next = odd[assignmentIndex]
            }
        }
                
        return odd[0]
    }
    
}

final class ListNode {
    let val: Int
    var next: ListNode?

    init(_ val: Int = 0, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

