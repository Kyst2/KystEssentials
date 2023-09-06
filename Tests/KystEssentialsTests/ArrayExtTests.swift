//
//  ArreyExtTests.swift
//  KystEssentialsTests
//
//  Created by Andrew Kuzmich on 29.06.2023.
//

import XCTest

final class ArrayExtTests: XCTestCase {

    func testSafeSubscript() throws {
        let numbers:[Int] = [1,2,3,4,5]
        
        XCTAssertEqual(numbers[safe: 3], 4)
        XCTAssertEqual(numbers[safe: -1], nil)
        XCTAssertEqual(numbers[safe: 5], nil)
        
        XCTAssertEqual(numbers[safeIdxArr: [0,2,3]], [1,3,4])
        XCTAssertEqual(numbers[safeIdxArr: 1...3], [2,3,4])
        XCTAssertEqual(numbers[safeIdxArr: 1..<4], [2,3,4])
        
        XCTAssertEqual(numbers[infinityIdx: 3], 4)
        XCTAssertEqual(numbers[infinityIdx: 5], 1)
        XCTAssertEqual(numbers[infinityIdx: 10], 1)
        
        XCTAssertEqual(numbers[infinityIdx: -1], 5)
        XCTAssertEqual(numbers[infinityIdx: -2], 4)
        XCTAssertEqual(numbers[infinityIdx: -6], 5)
        XCTAssertEqual(numbers[infinityIdx: -7], 4)
    }
}
