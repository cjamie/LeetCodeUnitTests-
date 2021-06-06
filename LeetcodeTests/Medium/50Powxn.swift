//
//  50Powxn.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/19/21.
//

import XCTest
/*

 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).



 Example 1:

 Input: x = 2.00000, n = 10
 Output: 1024.00000
 Example 2:

 Input: x = 2.10000, n = 3
 Output: 9.26100
 Example 3:

 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25


 */

class _0Powxn: XCTestCase {


    func test_solution() {

        let solution = iterativePow(1.5, 13)
        print("-=- solutino \(solution)")
        // we will deal with the if negative here (in beginnig of recursion)



    }

    func iterativePow(_ x: Double, _ n: Int) -> Double {
        var n = n
        var x = x
        // handle the negative case

        if n < 0 {
            x = 1/x
            n = -n
        }

        var counter: Double = 1

        while n > 0 {

            let (quotient, remainder) = n.quotientAndRemainder(dividingBy: 2)

            if remainder == 1 {
                print("-=- multiple \(counter) \(x) to become \(x * counter)")
                counter *= x
            }

            n = quotient // n/=2 is same as n >> 1
            x *= x

        }

        return counter
    }

    func recursivePow(_ x: Double, _ n: Int) -> Double {
        n < 0
            ? pow(x: 1/x, n: -n)
            : pow(x: x, n: n)
    }

    private func pow(x: Double, n: Int) -> Double {
        guard n != 0 else { return 1 }
        let value = pow(x: x, n: n/2)
        return value * value * (n % 2 == 0 ? 1 : x)
    }
}
