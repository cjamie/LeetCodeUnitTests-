//
//  TwoSum.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/26/20.
//

import XCTest


//Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//You can return the answer in any order.
//
//
//
//Example 1:
//
//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Output: Because nums[0] + nums[1] == 9, we return [0, 1].
//Example 2:
//
//Input: nums = [3,2,4], target = 6
//Output: [1,2]
//Example 3:
//
//Input: nums = [3,3], target = 6
//Output: [0,1]

class TwoSum: XCTestCase {

    func test() {
        let inputIntegers: [Int] = [2,7,11,15]
        let target = 9
        
        let result = twoSum(input: inputIntegers, target: target)
        
        // they don't care about the index order
        XCTAssert(result == [1,0] || result == [0,1])
    }

    /*
     
     TIME: -
     cache lookup is O(1)
     O(N) in time because there are N assertions for
     O(N) space because of the cache which scales with the input size (N)
          
     */
    
    private func twoSum(input: [Int], target: Int) -> [Int] {
        typealias ValueToIndex = [Int: Int]

        // this cache will store all of the input values, and their associated indexes for fast lookup.
        var cache: ValueToIndex = [:]
        
        // as we traverse the input array, we will add to the cache on-failure or return if we find a complement, returning the current index, and cache's index
        for (index, value) in input.enumerated() {
            // this is the value we are looking for from temp
            let complement = target - value
            
            // if index exists for complement, return it
            if let validIndex = cache[complement] {
                return [index, validIndex]
            } else {
                cache[value] = index
            }
        }
        
        return [-1, -1]
    }

}
