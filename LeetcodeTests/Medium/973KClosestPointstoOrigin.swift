//
//  973KClosestPointstoOrigin.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 6/20/21.
//

import XCTest

class ClosestPointstoOriginTestCase: XCTestCase {

    func test_zero(){

        let points = [
            [1,3],
            [-2,2],
        ]


        let actual = kClosest(points, 1)



    }



    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        points.map(toPoint)
            .map(calculateDifference)
            .sorted { left, right in left.value < right.value }
            .prefix(k)
            .map { toIntArray(from: $0.point) }
    }

    func toIntArray(from: Point) -> [Int] {
        [ from.x, from.y ]
    }

    private func calculateDifference(_ point: Point) -> (value: Double, point: Point) {
        (
            Double(point.x * point.x + point.y * point.y).squareRoot(),
            point
        )
    }

    private func toPoint(from original: [Int]) -> Point {
        return (original[0], original[1])
    }

}

typealias Point = (x: Int, y: Int)
