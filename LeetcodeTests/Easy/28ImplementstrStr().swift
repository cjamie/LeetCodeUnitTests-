//
//  28ImplementstrStr().swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/7/21.
//

import XCTest

class ImplementstrStr__: XCTestCase {

    /*
     
     Implement strStr().

     Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

     Clarification:

     What should we return when needle is an empty string? This is a great question to ask during an interview.

     For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

      

     Example 1:

     Input: haystack = "hello", needle = "ll"
     Output: 2
     Example 2:

     Input: haystack = "aaaaa", needle = "bba"
     Output: -1
     Example 3:

     Input: haystack = "", needle = ""
     Output: 0
     */
    func test() {

        let haystack = "acacat"
        let needle = "cat"
                
        let actual = strStr(haystack, needle)
        
        XCTAssertEqual(actual, 3)
        
    }
    
//    func strStr(_ haystack: String, _ needle: String) -> Int {
//        switch (haystack.isEmpty, needle.isEmpty){
//        case (true, false):
//            return -1
//        case (_, true):
//            return 0
//        case (false, false):
//            break
//        }
//
//        let haystackCount = haystack.count
//        let needleCount = needle.count
//        let needleCountDecremented = needleCount - 1
//        let upperBound = haystackCount - needleCount + 1
//
//        for i in stride(from: 0, to: upperBound, by: 1) {
//            for (index, ii) in needle.enumerated() {
//                if ii == haystack[i + index] {
//                    if index == needleCountDecremented {
//                        return i
//                    } else {
//                        continue
//                    }
//                } else {
//                    break
//                }
//            }
//        }
//
//        return 0
//    }
    

    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        switch (haystack.isEmpty, needle.isEmpty){
        case (true, false):
            return -1
        case (_, true):
            return 0
        case (false, false):
            let haystackCount = haystack.count
            let needleCount = needle.count

            let haystackArr = Array(haystack)
            let needleArr = Array(needle)

            for i in stride(
                from: 0,
                to: haystackCount - needleCount + 1,
                by: 1
            ) {
                if Array(haystackArr[i ..< i+needleCount]) == needleArr {
                    return i
                }
            }

            return -1
        }
    }
}
