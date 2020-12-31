//
//  8StringtoInteger(atoi).swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/30/20.
//

import XCTest

class StringtoInteger_atoi: XCTestCase {

    /*
     
     Implement atoi which converts a string to an integer.

     The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.

     The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.

     If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.

     If no valid conversion could be performed, a zero value is returned.

     Note:

     Only the space character ' ' is considered a whitespace character.
     Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, 231 − 1 or −231 is returned.
     
     */
    
    func test(){
        let inputString = "    some string "
        let actual = myAtoi(inputString)
        
        XCTAssertEqual(actual, 0)
        
        let inputString2 = "32"
        let actual2 = myAtoi(inputString2)
        XCTAssertEqual(actual2, 32)

        let inputString3 = "20000000000000000000"
        let actual3 = myAtoi(inputString3)
        XCTAssertEqual(actual3, Int.leetcodeMaximum)
    }
    
    func myAtoi(_ s: String) -> Int {
        
        // check remove whitespace from string
        //match optional +/- sign
        //match prefix characters to int
        //discard any characters afterwards
        
        // this trims the leading and trailing whitespaces (excluding middle)
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        
        let isNegative: Bool

        // prefix is a integral
        let iterationString: String
        
        if trimmed.hasPrefix("-") {
            isNegative = true
            
            iterationString = String(trimmed.dropFirst())
        } else if trimmed.hasPrefix("+") {
            isNegative = false
            iterationString = String(trimmed.dropFirst())
            
        } else {
            isNegative = false
            iterationString = trimmed
        }
        
        var counter = 0
        
        for character in iterationString {
            if let intValue = Int(String(character)) {
                counter = counter * 10 + intValue
                if counter > Int.leetcodeMaximum {
                    return isNegative ? Int.leetcodeMinimum : Int.leetcodeMaximum
                }
                
            } else {
                
                if counter > Int.leetcodeMaximum {
                    return isNegative ? Int.leetcodeMinimum : Int.leetcodeMaximum
                } else {
                    return isNegative ? -counter : counter
                }
            }
        }
        
        if counter > Int.leetcodeMaximum {
            return isNegative ? Int.leetcodeMinimum : Int.leetcodeMaximum
        } else {
            return isNegative ? -counter : counter
        }
    }

}

extension Int {
    static var leetcodeMaximum: Int {
        2147483647
    }
    
    static var leetcodeMinimum: Int {
        -2147483648
    }
}
