//
//  21MergeTwoSortedLists.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/1/21.
//

import XCTest

class MergeTwoSortedLists: XCTestCase {

    func test() {
        let firstList = ListNode(1)
        let firstTwo = ListNode(2)
        let firstFour = ListNode(4)

        let secondList = ListNode(1)
        let secondThree = ListNode(3)
        let secondFour = ListNode(4)

        firstList.next = firstTwo
        firstTwo.next = firstFour

        secondList.next = secondThree
        secondThree.next = secondFour
        
        print("-=- first test")
        _ = mergeTwoLists(firstList, secondList)
    }

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var firstRef = l1
        var secondRef = l2
        
        let sentinel = ListNode()
        var sentinelCounter = sentinel
        
        // NOTE: - the second ref takes precedent on ties
        while firstRef != nil || secondRef != nil {
            
            switch (firstRef, secondRef) {
            case let (nil, .some(y)):
                sentinelCounter.next = y
                sentinelCounter = y
                
                secondRef = secondRef?.next
            case let (.some(x), nil):
                sentinelCounter.next = x
                sentinelCounter = x

                firstRef = firstRef?.next

            case let (.some(x), .some(y)):
                if x.val > y.val {
                    sentinelCounter.next = y
                    sentinelCounter = y
                    
                    secondRef = secondRef?.next
                } else {
                    sentinelCounter.next = x
                    sentinelCounter = x
                    
                    firstRef = firstRef?.next
                }
            default:
                print("-=- impossible")
            }
        }

        return sentinel.next
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
