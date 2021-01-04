//
//  263UglyNumber.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/3/21.
//

import XCTest

class UglyNumber: XCTestCase {
    
    func test() {
        // GIVEN
        let input = 14
        let expected = false
        
        // WHEN
        let actual = isUgly(input)
        
        // THEN
        XCTAssertEqual(actual, expected)
    }
    
    func isUgly(_ num: Int) -> Bool {
        guard num != 0 else { return false }
        var numCopy = num

        // for each of numbers, divide/reduce it if it reduces cleanly
        [2,3,5].forEach {
            while numCopy % $0 == 0 {
                numCopy /= $0
            }
        }
                
        return numCopy == 1
    }
}
