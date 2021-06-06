//
//  372SuperPow.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/20/21.
//

import XCTest

class _72SuperPow: XCTestCase {

    func test_solution() {

//        a^b where a is positive, abd b is large positive int. given in the form of an array. //also mod it by 1337

        superPow(1, [19,2,3,2,1])
    }

    func superPow(_ a: Int, _ b: [Int]) -> Int {

        //naive solution


        let bReduced: Int = b.reduce(1) {
            pow(
                x: $0,
                y: pow(x: a, y: $1)
            ) % 1337
        }



        print("-=- breduced \(bReduced)")






        return 0
    }

    private func pow(x: Int, y: Int) -> Int {
        guard x != 0 else { return 1 }

        let temp = pow(x: x % 1337, y: y/2) % 1337

        return temp * temp * (y % 2 == 0 ? 1 : x % 1337) % 1337

    }
}
