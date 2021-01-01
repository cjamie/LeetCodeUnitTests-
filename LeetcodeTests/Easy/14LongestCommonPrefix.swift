//
//  14LongestCommonPrefix.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 12/31/20.
//

import XCTest

class LongestCommonPrefix: XCTestCase {

    
    /*
     
     
     Write a function to find the longest common prefix string amongst an array of strings.

     If there is no common prefix, return an empty string "".

      

     Example 1:

     Input: strs = ["flower","flow","flight"]
     Output: "fl"
     Example 2:

     Input: strs = ["dog","racecar","car"]
     Output: ""
     Explanation: There is no common prefix among the input strings.
      

     Constraints:

     0 <= strs.length <= 200
     0 <= strs[i].length <= 200
     strs[i] consists of only lower-case English letters.

     
     */

    func test() {
        let input = ["flower","flow","flight"]

        let actual = longestCommonPrefix(input)


        XCTAssertEqual(actual, "fl")
        
    }
    
    // This is normal way of doing this
    func longestCommonPrefix1(_ strs: [String]) -> String {
        guard let firstEntry = strs.first else { return "" }
        var prefixCounter = firstEntry

        for s in strs {
            let newPrefix = s.commonPrefix(with: prefixCounter)
            if  newPrefix.isEmpty {
                return newPrefix
            } else {
                prefixCounter = newPrefix
            }
        }

        return prefixCounter
    }

    // this will use a trie
    // TODO: - resolve edge cases
    func longestCommonPrefix(_ strs: [String]) -> String {
        let trie = WordTrie()
        trie.insert(words: strs)
        return trie.longestPrefixWord()
    }
}

private class TrieNode<T: Hashable> {
    // NOTE: - only the sentinel will have a nil value
    let value: T?
    private(set) var children: [T: TrieNode<T>] = [:]
    var isEnd = false

    init(value: T? = nil) {
        self.value = value
    }
    
    func addChild(withValue value: T) {
        guard children[value] == nil else { return }
        children[value] = TrieNode(value: value)
    }
}


private class WordTrie {
    typealias Node = TrieNode<Character>
    private let sentinel = Node()
    
    func insert(word: String) {
        guard !word.isEmpty else { return }
        var nodeCounter = sentinel

        let characters = word.map{$0}
        
        characters
            .forEach { character in
                if let existingNode = nodeCounter.children[character] {
                    nodeCounter = existingNode
                } else {
                    nodeCounter.addChild(withValue: character)
                    nodeCounter = nodeCounter.children[character]!
                }
            }
        nodeCounter.isEnd = true
    }
    
    func insert(words: [String]) {
        words.forEach(insert)
    }
    
    func longestPrefixWord() -> String {
        var nodeCounter = sentinel
        var stringCounter = ""


        while nodeCounter.children.count == 1 {
            let nextNode = nodeCounter.children.first!.value
            nodeCounter = nextNode
            
            stringCounter += String(nextNode.value!)
        }
        
        return stringCounter
    }
    
}
