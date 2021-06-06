//
//  35SearchInsertPosition.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/19/21.
//

import XCTest

/*

 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.

 Example 1:

 Input: nums = [1,3,5,6], target = 5
 Output: 2
 Example 2:

 Input: nums = [1,3,5,6], target = 2
 Output: 1
 Example 3:

 Input: nums = [1,3,5,6], target = 7
 Output: 4
 Example 4:

 Input: nums = [1,3,5,6], target = 0
 Output: 0
 Example 5:

 Input: nums = [1], target = 0
 Output: 0
 */

// TODO: - fix this
class _5SearchInsertPosition: XCTestCase {

    func test_zero() {

        let solution = searchInsert(
            [1,3,5,6],
            7
        )

        print("-=- solution \(solution)")
    }

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {

        var counter = 0
        let count = nums.count - 1
        

        while nums[counter] < target, counter < count {
            counter += 1
        }

        return counter
    }

//    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//        searchInsert(nums, target, 0, nums.count - 1)
//    }

    func searchInsert(
        _ nums: [Int],
        _ target: Int,
        _ left: Int,
        _ right: Int
    ) -> Int {
        // if this is the case when the left side exceeds 1.
        if left > right {
            return right + 1
        }

        let mid = (left + right) / 2

        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            return searchInsert(nums, target, left, mid - 1)
        }
        return searchInsert(nums, target, mid + 1, right)
    }

}
