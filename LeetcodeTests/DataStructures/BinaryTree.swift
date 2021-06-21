//
//  BinaryTree.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 6/20/21.
//

import XCTest

class BinaryTreeTestCase: XCTestCase {
    func test_sumOfElementsInTree() {
        let value = recursivelyGenerateSum(from: makeSUT())

        print("-=- \(#function) \(value)")
    }


    func test_maximumValueInTree() {
        let value = recursivelyGetMaximumValue(from: makeSUT())

        print("-=- \(#function) \(value)")
    }

    func test_iterativelyGetHeightOfTree() {
        var nodePointer = makeSUT()
        var counter = 1

        while let next = nodePointer.left {
            nodePointer = next
            counter += 1
        }

        print("-=- \(#function) \(counter)")
    }

    func test_recursivelyGetHeightOfTree() {
        let value = recursivelyGetMaximumHeight(from: makeSUT())

        print("-=- \(#function) \(value)")
    }


    // MARK: - Helpers

    private func makeSUT() -> BinaryNode {
        let first = BinaryNode(1)
        let second = BinaryNode(2)
        let third = BinaryNode(3)
        let fourth = BinaryNode(4)
        let fifth = BinaryNode(5)
        let sixth = BinaryNode(6)
        let seventh = BinaryNode(7)


        first.left = second
        first.right = third

        second.left = fourth
        second.right = fifth

        third.left = sixth
        third.right = seventh

        return first
    }

    private func recursivelyGetMaximumValue(from node: BinaryNode) -> Int {
        maxValue(from: node)
    }

    private func recursivelyGenerateSum(from node: BinaryNode) -> Int {
        sum(from: node)
    }

    private func recursivelyGetMaximumHeight(from node: BinaryNode) -> Int {
        height(from: node)
    }

    private func height(from node: BinaryNode) -> Int {
        if let left = node.left, let right = node.right {
            return max(height(from: left), height(from: right)) + 1
        } else if let left = node.left {
            return height(from: left) + 1
        } else {
            return 1
        }
    }

    private func sum(from node: BinaryNode) -> Int {
        if let left = node.left, let right = node.right {
            return sum(from: left) + sum(from: right) + node.value
        } else if let left = node.left {
            return sum(from: left) + node.value
        } else {
            return node.value
        }
    }

    private func maxValue(from node: BinaryNode?) -> Int {
        if let node = node {
            return [
                maxValue(from: node.left),
                maxValue(from: node.right),
                node.value
            ].max()!
        } else {
            return .min
        }
    }
}


final class BinaryNode {
    let value: Int

    var left: BinaryNode?
    var right: BinaryNode?


    init(_ value: Int) {
        self.value = value
    }
}
