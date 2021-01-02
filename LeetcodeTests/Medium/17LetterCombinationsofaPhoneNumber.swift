//
//  17LetterCombinationsofaPhoneNumber.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 1/1/21.
//

import XCTest

class LetterCombinationsofaPhoneNumber: XCTestCase {

    /*
     Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

     A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.



      

     Example 1:

     Input: digits = "23"
     Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
     Example 2:

     Input: digits = ""
     Output: []
     Example 3:

     Input: digits = "2"
     Output: ["a","b","c"]
     
     */
    
    func test() {
        let digits = "23"

        XCTAssertEqual(
            letterCombinations(digits),
            ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        )
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        
        let telephoneButtons: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"],
        ]
        
        let appendables: [[Character]] = digits.map {
            telephoneButtons[$0]!
        }
        
        return appendables.reduce(into: [String]()) {
            $0 = combine(lhs: $0, rhs: $1)
        }
    }
    
    func combine(lhs: [String], rhs: [Character]) -> [String] {
        guard !lhs.isEmpty else { return rhs.map{String($0)} }
        var counter: [String] = []
        
        for char in lhs {
            for char2 in rhs {
                counter.append(char + String(char2))
            }
        }
        
        return counter
    }
    
    // TODO: - revisit linked list solution
}
