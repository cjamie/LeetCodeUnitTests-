//
//  15_3Sum.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/31/20.
//

import XCTest

class ThreeSum: XCTestCase {
    
    
    /*
     
     Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
     
     Notice that the solution set must not contain duplicate triplets.
     
     
     
     Example 1:
     
     Input: nums = [-1,0,1,2,-1,-4]
     Output: [[-1,-1,2],[-1,0,1]]
     Example 2:
     
     Input: nums = []
     Output: []
     Example 3:
     
     Input: nums = [0]
     Output: []
     
     */
    func test() {
        //        let nums = [-1,0,1,2,-1,-4]
        
        //        let expected = [
        //            [-1,-1,2],
        //            [-1,0,1]
        //        ]
        
        let nums = [1,2,-2,-1]
        let expected: [[Int]] = []
        let actual = threeSum(nums)
        XCTAssertEqual(actual, expected)
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        
        var returnCounter: [[Int]] = []

        for i in stride(from: 0, to: sortedNums.count - 2, by: 1) {
            // if it matches the next one, go next
            
            let currentValue = sortedNums[i]
            let nextValue = sortedNums[i+1]
            
//            if currentValue == nextValue && iCannotCreateSolutionWithCurrentAndNext  {
//                // if next value is a solution,
//                if
//
//                continue }
             
            
            
            
            
            let currentArray = sortedNums[i+1..<sortedNums.count]
            
            let currentComplement = -currentValue
            
            let currentSolution = twoSum(input: currentArray, target: currentComplement)
            
            let temp: [[Int]] = currentSolution.map {
                [ currentValue,
                  $0.first,
                  $0.second
                ]
            }
            

            returnCounter.append(contentsOf: temp)
            
        }
        return returnCounter
    }
    
    
}

typealias FirstSecond = (first: Int, second: Int)

private func twoSum(input: ArraySlice<Int>, target: Int) -> [FirstSecond] {
    typealias ValueToIndex = [Int: Int]
    
    // this cache will store all of the input values, and their associated indexes for fast lookup.
    var cache: ValueToIndex = [:]
    
    // as we traverse the input array, we will add to the cache on-failure or return if we find a complement, returning the current index, and cache's index
    
    var returnCounter: [FirstSecond] = []
    
    for (index, value) in input.enumerated() {
        // this is the value we are looking for from temp
        let complement = target - value
        
        // if index exists for complement, return it
        if let validIndex = cache[complement] {
            
            returnCounter.append((
                input[validIndex],
                input[index]
            ))
        } else {
            cache[value] = index
        }
    }
    
    return returnCounter
}
