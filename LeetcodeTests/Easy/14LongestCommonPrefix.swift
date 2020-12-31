//
//  14LongestCommonPrefix.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/31/20.
//

import XCTest

class LongestCommonPrefix: XCTestCase {

    
    /*
     
     
     Write a function to find the longest common prefix string amongst an array of strings.

     If there is no common prefix, return an empty string "".

      

     Example 1:

     Input: strs = ["flower","flow","flight"]
     Output: "fl"
     Example 2:

     Input: strs = ["dog","racecar","car"]
     Output: ""
     Explanation: There is no common prefix among the input strings.
      

     Constraints:

     0 <= strs.length <= 200
     0 <= strs[i].length <= 200
     strs[i] consists of only lower-case English letters.

     
     */

    func test() {
        let input = ["flower","flow","flight"]
        
        let actual = longestCommonPrefix(input)
        
        
        XCTAssertEqual(actual, "fl")
        
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstEntry = strs.first else { return "" }
        var prefixCounter = firstEntry
                
        for s in strs {
            let newPrefix = s.commonPrefix(with: prefixCounter)
            if newPrefix.isEmpty {
                return newPrefix
            } else {
                prefixCounter = newPrefix
            }
        }
        
        return prefixCounter
    }
}
