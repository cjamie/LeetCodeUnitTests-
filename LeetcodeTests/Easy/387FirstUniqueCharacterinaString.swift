//
//  387FirstUniqueCharacterinaString.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 6/8/21.
//

import XCTest

class FirstUniqueCharacterinAString: XCTestCase {

    func test_zero() {
        let someString = "anyString"

    }
}


func firstUniqChar(_ s: String) -> Int {
    let cache: [Character: Int] = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    return s
        .enumerated()
        .first(where: {cache[$0.element] == 1})?
        .offset ?? -1
}
