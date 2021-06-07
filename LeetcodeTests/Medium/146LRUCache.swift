//
//  146LRUCache.swift
//  LeetcodeTests
//
//  Created by Jamie Chu on 5/22/21.
//

import XCTest
/*

 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 Follow up:
 Could you do get and put in O(1) time complexity?



 Example 1:

 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4


 Constraints:

 1 <= capacity <= 3000
 0 <= key <= 3000
 0 <= value <= 104
 At most 3 * 104 calls will be made to get and put.



 */
class LRUCacheTest: XCTestCase {

    func test_whenEmpty_shouldReturnNegative1() {

        let sut = LRUCache(2)

        sut.put(1, 1); // cache is {1=1}
        sut.put(2, 2); // cache is {1=1, 2=2}
        XCTAssertEqual(sut.get(1), 1)

        sut.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
        XCTAssertEqual(sut.get(2), -1)

        sut.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
        XCTAssertEqual(sut.get(1), -1)
        XCTAssertEqual(sut.get(3), 3)
        XCTAssertEqual(sut.get(4), 4)
    }


    class LRUCache {
        var cache: [Int: Int] = [:]
        var order: [Int] = []
        var capacity: Int = 0

        init(_ capacity: Int) {
            self.capacity = capacity
        }

        func get(_ key: Int) -> Int {
            moveToEnd(key)
            return cache[key] ?? -1
        }

        private func moveToEnd(_ key: Int) {
            if let indexV = order.firstIndex(of: key) {
                order.remove(at: indexV)
                order.append(key)
            }
        }

        func put(_ key: Int, _ value: Int) {


            // is non existing value, and cache is full
            if cache[key] == nil && cache.count+1 > capacity {
                let lastKey = order.first!
                cache.removeValue(forKey: lastKey)
                if let indexV = order.firstIndex(of: lastKey) {
                    order.remove(at: indexV)
                }
            }

            cache[key] != nil // if there is an existing key, more it to the end
                ? moveToEnd(key)
                : order.append(key) // otherwise, add it into the order.

            cache[key] = value
        }
    }
}

class LRUCache {
    /// i need a proxy for this
    private let capacity: Int
    var underlying: [Int: Int] = [:]
    var lastSuccessfulRequested: [Int] = []


    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard let presentValue = underlying[key] else { return -1 }

        addKeyToTheLastRequest(key)

        return presentValue
    }

    func put(_ key: Int, _ value: Int) {
        if underLyingIsfull {
            if underlyingHasExistingExtry(forKey: key) {
                underlying[key] = value
                addKeyToTheLastRequest(key)
            } else {
                deleteLeastRecentlyUsed(key: key)
                underlying[key] = value
            }

        } else {
            underlying[key] = value
            addKeyToTheLastRequest(key)
        }
    }

    private func addKeyToTheLastRequest(_ key: Int) {
        if let index = lastSuccessfulRequested.firstIndex(of: key), isLastSuccessfulRequestedFull {
            lastSuccessfulRequested.remove(at: index)
        }

        lastSuccessfulRequested.append(key)
    }

    // this should always succeed
    private func deleteLeastRecentlyUsed(key: Int) {
        if let first = lastSuccessfulRequested.first {
            underlying[first] = nil
            lastSuccessfulRequested.removeFirst()
        }
    }

    private var underLyingIsfull: Bool {
        underlying.count == capacity
    }

    private var isLastSuccessfulRequestedFull: Bool  {
        lastSuccessfulRequested.count == capacity
    }

    private func underlyingHasExistingExtry(forKey: Int) -> Bool {
        underlying[forKey] != nil
    }
}
