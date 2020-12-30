//
//  5LongestPalindromicSubstring.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/27/20.
//

import XCTest

class LongestPalindromicSubstring: XCTestCase {

    /*
     Given a string s, return the longest palindromic substring in s.
     
     Input: s = "babad"
     Output: "bab"
     Note: "aba" is also a valid answer.
     
     Input: s = "cbbd"
     Output: "bb"

     
     Input: s = "a"
     Output: "a"
     
     Input: s = "ac"
     Output: "a"
     */
    func test() {
        let input = "babadabfeuwifuewiuebui"
//        let finalAnswer = longestPalindrome(input)
//        print("-=- finalAnswer \(finalAnswer)")        
    }

    private func longestPalindrome(_ s: String) -> String {
        
        guard !s.isEmpty else {return ""}

        var left = 0
        var right = 0
        
        s.enumerated().forEach { index, char in
//            print("-=- largest \(answer)")
            
            let firstAllowed = allowableExpanding(of: s, from: index, to: index)
            let secondAllowed = allowableExpanding(of: s, from: index, to: index+1)

            let maxAllowed = max(firstAllowed, secondAllowed)
            
            // if this new maxallowed is greater, update your left and right
            if maxAllowed > right - left {
                left = index - (maxAllowed - 1) / 2
                right = index + maxAllowed / 2
            }
        }
        
        
        print("-=- 2 \(left) \(right)")

        return String(s[left...right])
    }
    
    private func allowableExpanding(of inputString: String, from: Int, to: Int) -> Int {
        
        var left = from
        var right = to
        
        while left >= 0 && right < inputString.count, inputString[left] == inputString[right] {
            // update our bounds by 1
            
            left -= 1
            right += 1
        }
        // TODO:- clarifyon the -1
        return right - left - 1
    }
    
//    private func largestSubstringFrom(index: Int, in inputString: String) -> String {
//    }

}
