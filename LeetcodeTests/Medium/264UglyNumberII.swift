//
//  264UglyNumberII.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/2/21.
//

import XCTest

class UglyNumberII: XCTestCase {

    /*
     
     Write a program to find the n-th ugly number.

     Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.

     Example:

     Input: n = 10
     Output: 12
     Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
     Note:

     1 is typically treated as an ugly number.
     n does not exceed 1690.

     */
    func test() {
        let input = 10
        let expected = 12

        XCTAssertEqual(nthUglyNumber(input), expected)
    }
    
    func nthUglyNumber(_ n: Int) -> Int {
        guard n != 0 else { return 0 }

        // stores all of the ugly numbers. example: [1,2,3,4,5,6,8,9,10,12]...
        var cache = [1]
//        cache.reserveCapacity(n)

        // these properties indexes used to keep track of the current largest 2,3,and 5's.
        var p2 = 0
        var p3 = 0
        var p5 = 0

        for _ in 1..<n {
            let twoFactored = cache[p2] * 2
            let threeFactored = cache[p3] * 3
            let fiveFactored = cache[p5] * 5

            // evaluate the minimum value
            let currentMin = min(
                twoFactored,
                threeFactored,
                fiveFactored)
            
            // update the corresponding p2,p3,p5 counters that matches to the minValue. this prepares the counters for evaluating the currentMin in next iteration
            if currentMin == threeFactored {
                p3 += 1
            }
            if currentMin == fiveFactored {
                p5 += 1
            }
            if currentMin == twoFactored {
                p2 += 1
            }

            cache.append(currentMin)
        }
        
        return cache.last!
    }
}
