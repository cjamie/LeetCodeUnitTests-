//
//  121BestTimetoBuyandSellStock.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/23/21.
//

import XCTest

/*

 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.



 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 Example 2:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.


 Constraints:

 1 <= prices.length <= 105
 0 <= prices[i] <= 104

 */
class BestTimetoBuyandSellStockTest: XCTestCase {

    func test_zero() {
        let prices = [
            7, // counter = 0, currentMin = 0
            1, // counter = 0, currentMin = 1
            5, // counter = 4, currentMin = 1
            3, // counter = 4, currentMin = 1
            6, // counter = 5, currentMin = 1
            4, // counter = 5, currentMin = 1
        ]

        // iterate through the array and maintain a currentMin and currentMax value

        // at the time of changing a currentMix or currentMax, then we should compute the latest difference

        XCTAssertEqual(maxProfitBruteForce(prices), 5)
    }

    // brute force
    func maxProfitBruteForce(_ prices: [Int]) -> Int {
        prices
            .reduce(into: (final: 0, currentMin: Int.max)) { acc, price in
                if price < acc.1 {
                    acc.1 = price
                } else if price - acc.1 > acc.0 {
                    acc.0 = price - acc.1
                }
            }.final
    }
}
