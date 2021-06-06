//
//  13RomantoInteger.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/30/20.
//

import XCTest

class RomantoInteger: XCTestCase {

    /*
     
     Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

     Symbol       Value
     I             1
     V             5
     X             10
     L             50
     C             100
     D             500
     M             1000
     For example, 2 is written as II in Roman numeral, just two one's added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

     Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

     I can be placed before V (5) and X (10) to make 4 and 9.
     X can be placed before L (50) and C (100) to make 40 and 90.
     C can be placed before D (500) and M (1000) to make 400 and 900.
     Given a roman numeral, convert it to an integer.
     
     
     */

    func test() {
        let input = "III"
        
        XCTAssertEqual(romanToInt(input), 3)
    }
    
    
    private static let symbolValues: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000,
    ]

    func romanToInt(_ s: String) -> Int {
        s.enumerated().reduce(into:0) { acc, enumerated in
            let (currentIndex, current) = enumerated
            let currentValue = Self.symbolValues[current]!
            let nextIndex = currentIndex + 1

            if nextIndex < s.count, Self.symbolValues[s[nextIndex]]! > currentValue {
                acc -= currentValue
            } else {
                acc += currentValue
            }
        }
    }
}
