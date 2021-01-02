//
//  20ValidParentheses.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/1/21.
//

import XCTest

class ValidParentheses: XCTestCase {

    /*
     
     Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

     An input string is valid if:

     Open brackets must be closed by the same type of brackets.
     Open brackets must be closed in the correct order.
     
     */

    func test() {
        let expectedTrues = [
            "()",
            "()[]{}",
            "{[]}"
        ]

        expectedTrues.forEach{
            XCTAssert(isValid($0))
        }

        let expectedFalses = [
            "(]",
            "([)]"
        ]

        expectedFalses.forEach{
            XCTAssert(isValid($0) == false)
        }

        
//        isValid("()")
        
    }
    
    func isValid(_ s: String) -> Bool {        
        var stackCounter: [Character] = []
        
        for char in s {
            if char.isLeading {
                stackCounter.append(char)
            } else if let lastElement = stackCounter.last { // current char is an analog to the last
                switch (lastElement, char) {
                case ("[","]"),
                     ("{","}"),
                     ("(",")"):
                    _ = stackCounter.popLast()
                default:
                    return false
                }
                
                
            } else {
                return false
            }
        }
        
        return stackCounter.isEmpty
    }

}


extension Character {
    
    private static let leadingSet: [Character] = [
        "(",
        "{",
        "["
    ]
    
    var isLeading: Bool {
        Self.leadingSet.contains(self)
    }
}
