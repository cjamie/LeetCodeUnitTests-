//
//  26RemoveDuplicatesfromSortedArray.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/7/21.
//

import XCTest

class RemoveDuplicatesfromSortedArray: XCTestCase {

    /*
     
     Given a sorted array nums, remove the duplicates in-place such that each element appears only once and returns the new length.

     Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

     Clarification:

     Confused why the returned value is an integer but your answer is an array?

     Note that the input array is passed in by reference, which means a modification to the input array will be known to the caller as well.

     Internally you can think of this:

     // nums is passed in by reference. (i.e., without making a copy)
     int len = removeDuplicates(nums);

     // any modification to nums in your function would be known by the caller.
     // using the length returned by your function, it prints the first len elements.
     for (int i = 0; i < len; i++) {
         print(nums[i]);
     }
      

     Example 1:

     Input: nums = [1,1,2]
     Output: 2, nums = [1,2]
     Explanation: Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the returned length.
     Example 2:

     Input:s nums = [0,0,1,1,1,2,2,3,3,4]
     Output: 5, nums = [0,1,2,3,4]
     Explanation: Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively. It doesn't matter what values are set beyond the returned length.
     */

    func test() {
        var input = [1,1,2]
        let expected = [1,2]
        
        let count = removeDuplicates(&input)
        
        XCTAssertEqual(input, expected)
        XCTAssertEqual(count, 2)
    }

    // we actually want to remove from larger indexes, because deleting from the front is a more expensive operation
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let count = nums.count
        var numberCounter = Int.max
        
        nums.reversed()
            .enumerated()
            .forEach { (index, num) in
            
            if num == numberCounter {
                let currentIndex = count - index - 1
                nums.remove(at: currentIndex)
            }
            numberCounter = num
        }

        return nums.count
    }

}
