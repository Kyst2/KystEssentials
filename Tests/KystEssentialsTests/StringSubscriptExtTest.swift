//
//  StringSubscriptExtTest.swift
//  KystEssentialsTests
//
//  Created by Andrew Kuzmich on 22.06.2023.
//

import XCTest

final class StringSubscriptExtTest: XCTestCase {

    func testCharByIdx() throws {
        XCTAssertEqual("hello world"[charByIdx: 5]," ")
        XCTAssertEqual("hello world"[charByIdx: 0],"h")
        
    }

}
