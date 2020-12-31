//
//  9PalindromeNumber.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/30/20.
//

import XCTest

class PalindromeNumber: XCTestCase {

    /*
     Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

     Follow up: Could you solve it without converting the integer to a string?
     
     */
    
    func test() {
        /*
         
         Example 1:

         Input: x = 121
         Output: true
         Example 2:

         Input: x = -121
         Output: false
         Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
         Example 3:

         Input: x = 10
         Output: false
         Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
         Example 4:

         Input: x = -101
         Output: false
         */
        let palindromeNumbers = [
            121,
            5743475
        ]
        
        let nonPalindromeNumbers = [
            -121,
            10,
            0
        ]

        palindromeNumbers.forEach {
            
            
            XCTAssert(isPalindrome($0))
        }
        
        nonPalindromeNumbers.forEach {
            
            XCTAssertFalse(isPalindrome($0))
        }
        
    }

    
    func isPalindrome(_ x: Int) -> Bool {
        
        guard x >= 0 else { return false }
        
        if x%10 == 0 && x != 0 {
            return false
        }
        var xCopy = x

        var reversedInt = 0
        
        while xCopy > reversedInt {
            let poppedValue = xCopy%10

            reversedInt = reversedInt * 10 + poppedValue

            xCopy /= 10 // pop xcopy by 1 digit
        }        
        
        return reversedInt == xCopy || reversedInt/10 == xCopy
    }
}
