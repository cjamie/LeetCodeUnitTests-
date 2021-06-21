//
//  43MultiplyStrings.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 6/19/21.
//

import XCTest

/*
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.



 Example 1:

 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:

 Input: num1 = "123", num2 = "456"
 Output: "56088"


 Constraints:

 1 <= num1.length, num2.length <= 200
 num1 and num2 consist of digits only.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.

 */

class _3MultiplyStrings: XCTestCase {
    func test_zero() {
        let acutal = multiply("2", "3")




        XCTAssertEqual(acutal, "6")
    }


    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }

        var n1 = Array(num1.reversed())
        var n2 = Array(num2.reversed())

        var allProducts: [[Int]] = []
        for (i, c1) in n1.enumerated() {
            var digits: [Int] = []
            var carry = 0
            for _ in 0..<i { digits.append(0) }
            for (j, c2) in n2.enumerated() {
                let val1 = c1.asciiValue! - Character("0").asciiValue!
                let val2 = c2.asciiValue! - Character("0").asciiValue!
                let prod = Int(val1) * Int(val2) + carry
                let digit = prod % 10
                carry = prod / 10
                digits.append(digit)
            }
            if carry > 0 { digits.append(carry) }
            allProducts.append(digits)
        }

        var result = ""
        var maxDigits = 0
        allProducts.forEach { maxDigits = max(maxDigits, $0.count) }
        var carry = 0
        for i in 0..<maxDigits {
            var sum = 0
            for prodArr in allProducts {
                if i < prodArr.count {
                    sum += prodArr[i]
                }
            }
            sum += carry
            let digit = sum % 10
            carry = sum / 10
            result.append("\(digit)")
        }

        if carry > 0 {
            result.append("\(carry)")
        }

        let finalResult = result.reversed()
        return String(finalResult)
    }
}
