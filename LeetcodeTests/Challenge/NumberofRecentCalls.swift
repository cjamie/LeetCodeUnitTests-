//
//  NumberofRecentCalls.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/21/21.
//

import XCTest
//https://leetcode.com/explore/challenge/card/october-leetcoding-challenge/559/week-1-october-1st-october-7th/3480/
class NumberofRecentCalls: XCTestCase {

    func test_zero() {
        let sut = RecentCounter()

        let anyDouble: Int = 328

        let a = sut.ping(anyDouble)
        let b = sut.ping(anyDouble)
    }
}


final class RecentCounter {
    private var requests: [Int] = []

    // adds a new request at time t, where t is the tiem in milliseconds. (returns number of requsts in the past 3 milliseconds).
    func ping(_ t: Int) -> Int {
        requests.append(t)

//        return requests.reduce(into: 0) { acc, next in
//            acc += next.isInRange(of: (t - 3000)...t)
//                ? 1
//                : 0
//        }

        let threshold = t - 3000
        if let leftIndex = requests.firstIndex(where: { $0 >= threshold }) {
            return requests.count - leftIndex
        } else {
            return requests.count
        }
    }
}

extension Int {
    func isInRange(of range: ClosedRange<Int>) -> Bool {
        range.contains(self)
    }
}
