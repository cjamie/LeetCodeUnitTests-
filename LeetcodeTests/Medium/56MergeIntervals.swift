//
//  56MergeIntervals.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/23/21.
//

import XCTest
/*

 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.



 Example 1:

 Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: intervals = [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.


 Constraints:

 1 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti <= endi <= 104

 */
class MergeIntervalsTests: XCTestCase {

    func test() {
        let intervals = [[2,3],[4,5],[6,7],[8,9],[1,10]]

        let temp = merge(intervals)
    }

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals
            .sorted(by: {$0[0] < $1[0] })
            .map { RawInterval(start: $0[0], end: $0[1]) }


        var finalStack: [RawInterval] = [sorted[0]]

        sorted.dropFirst().forEach { current in
            if current.start <= finalStack.last!.end {
                let last = finalStack.last!

                finalStack[finalStack.count - 1] = RawInterval(
                    start: min(last.start, current.start),
                    end: max(current.end, last.end)
                )
            } else {
                finalStack.append(current)
            }

        }

        return finalStack.map(toArray)
    }

    private func toArray(_ rawInterval: RawInterval)-> [Int] {
        [rawInterval.start, rawInterval.end]
    }

    private struct RawInterval {
        let start: Int
        let end: Int

        //        func isContiguousWith(_ interval: RawInterval) -> Bool {
        //            if interval.start > start, interval.end < end {
        //                return true
        //            } else if {
        //                interval
        //            }
        //        }

    }
}
