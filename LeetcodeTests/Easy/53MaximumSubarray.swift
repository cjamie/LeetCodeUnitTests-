//
//  53. Maximum Subarray
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/22/21.
//


/*Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.



 Example 1:

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Example 2:

 Input: nums = [1]
 Output: 1
 Example 3:

 Input: nums = [5,4,-1,7,8]
 Output: 23**/
import XCTest


// this is disingenuous to call to
class MaximumSubarray: XCTestCase {

    func test() {
        let nums = [-2,1,-3,4,-1,2,1,-5,4]
        let actual = maxSubArray(nums)

        XCTAssertEqual(actual, 6)
    }


    func maxSubArray(_ nums: [Int]) -> Int {
        nums
            .dropFirst()
            .reduce(into: (nums[0], nums[0])) { acc, next in
                let newAccCurrent = max(next, acc.0 + next)
                acc = (newAccCurrent, max(acc.1, newAccCurrent))
            }.1
    }
}
