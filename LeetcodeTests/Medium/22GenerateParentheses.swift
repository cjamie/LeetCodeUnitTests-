//
//  22GenerateParentheses.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/2/21.
//

import XCTest

class GenerateParentheses: XCTestCase {

    /*
     
     Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

      

     Example 1:

     Input: n = 3
     Output: ["((()))","(()())","(())()","()(())","()()()"]
     Example 2:

     Input: n = 1
     Output: ["()"]
     
     */

    func test() {
        let n = 3
        let expected = [
            "((()))",
            "(()())",
            "(())()",
            "()(())",
            "()()()"
        ]

        XCTAssertEqual(
            generateParenthesis(n),
            expected
        )
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var answer: [String] = []
    
        backtrack(
            answer: &answer,
            current: "",
            max: n)

        return answer
      }
    
    // NOTE: - can modify this so that it takes in open and closed count, so we wouldn't have to calculate this every time we're pulling open and closed count. The performance would improve, but readability and intent would suffer.
    private func backtrack(
        answer: inout [String],
        current: String,
        max: Int
    ) {
        // if the current length is max * 2, the string is finished, and you can append
        guard current.count < max * 2 else {
            answer.append(current)
            return
        }
        
        // these following lines will cover every single case.

        // if we have not reached max open, add one.
        if current.openCount < max {
            backtrack(
                answer: &answer,
                current: current + "(",
                max: max)
        }
        
        // this will force us to add a close, regardless (from the previous if statement) - effectively complementing the last open parenthesis.
        if current.closedCount < current.openCount {
            backtrack(
                answer: &answer,
                current: current + ")",
                max: max)
        }
    }
}

extension String {
    var openCount: Int {
        charCount(of: "(")
    }
    
    var closedCount: Int {
        charCount(of: ")")
    }
    
    private func charCount(of character: Character) -> Int {
        map {$0}
            .reduce(into: 0) { accumulator, next in
                accumulator = next == character
                    ? accumulator + 1
                    : accumulator
            }
    }
}
