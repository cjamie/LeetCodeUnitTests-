//
//  11ContainerWithMostWater.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/30/20.
//

import XCTest

class ContainerWithMostWater: XCTestCase {
    
    /*
     Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.
     
     Notice that you may not slant the container.
     
     */
    
    
    func test() {
        let heights = [1,8,6,2,5,4,8,3,7]

        
        
        XCTAssertEqual(maxArea(heights), 49)
    }
    
    func maxArea(_ heights: [Int]) -> Int {
        
        var leftIndex = 0
        var rightIndex = heights.count - 1
        
        var areaCounter = 0
        // while they are not next to each other
        while leftIndex != rightIndex {
            
            let leftHeight = heights[leftIndex]
            let rightHeight = heights[rightIndex]

            let minHeight = min(leftHeight, rightHeight)
            let width = rightIndex - leftIndex
            
            let currentArea = minHeight * width
            
            areaCounter = max(areaCounter, currentArea)
            
            // we keep the larger height's index, so we move the shorter one
            // NOTE: - we can hyperoptimize this by making multiple updates to index here
            if leftHeight > rightHeight {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }

        return areaCounter
    }
    
    func bruteForceMaxArea(_ heights: [Int]) -> Int {
        var maxCounter = 0
        
        for i in stride(from: 0, to: heights.count, by: 1) {
            for ii in stride(from: i+1, to: heights.count, by: 1) {
                let leftHeight = heights[i]
                let rightHeight = heights[ii]
                
                let minHeight = min(leftHeight, rightHeight)
                let width = ii - i
                maxCounter = max(maxCounter, minHeight*width)
            }
        }
        
        return maxCounter
    }
}
