//
//  322CoinChange.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 6/7/21.
//

import Foundation
import XCTest

/*
 You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

 Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 You may assume that you have an infinite number of each kind of coin.



 Example 1:

 Input: coins = [1,2,5], amount = 11
 Output: 3
 Explanation: 11 = 5 + 5 + 1
 Example 2:

 Input: coins = [2], amount = 3
 Output: -1
 Example 3:

 Input: coins = [1], amount = 0
 Output: 0
 Example 4:

 Input: coins = [1], amount = 1
 Output: 1
 Example 5:

 Input: coins = [1], amount = 2
 Output: 2


 */
class CoinChange: XCTestCase {


    func test_zer() {
        coinChange([1,2,5], 11)
    }

    func coinChange(_ coins: Set<Int>, _ amount: Int) -> Int {
        let invalidValue = amount + 1

        var result = (0...amount).map { _ in invalidValue }

        // define the base case
        result[0] = 0

        (0...amount).forEach { i in
            for coin in coins.sorted() {
                if coin <= i { // if the coin is smaller than i, then
                    result[i] = min(
                        result[i],
                        result[i - coin] + 1 // result[i-coin] represents the minimum necessary to make up the target
                    )
                } else {
                    break
                }
            }
        }

        return result[amount] == amount + 1
            ? -1
            : result[amount]
    }


}
