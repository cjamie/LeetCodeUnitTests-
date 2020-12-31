//
//  7ReverseInteger.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/30/20.
//

import XCTest
/*
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Note:
 Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 
 */
class ReverseInteger: XCTestCase {
    
    func test() {
        let input1 = 123
        //        Output: 321
        //        Example 2:
        
        //        let input2 = -123
        //        Output: -321
        //        Example 3:
        
        //        let input3 = 120
        //        Output: 21
        //        Example 4:
        
        //        let input4 = 0
        //        Output: 0
        
        let actual = reverse(input1)
        
        XCTAssertEqual(actual, 321)
        
    }
    
    func reverse(_ x: Int) -> Int {
        let isNegative = x < 0
        var xCopy = abs(x)
        var returnValue = 0
 
        while xCopy > 0  {
            let newValue = xCopy%10
            
            returnValue = returnValue * 10 + newValue
            xCopy /= 10
        }
        
        let isOverflow = returnValue > 2147483647 || returnValue < -2147483648
        
        return isOverflow ? 0 : (isNegative ? -returnValue : returnValue)
    }
}
