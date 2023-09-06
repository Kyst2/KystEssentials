//
//  StringProtocolExt.swift
//  KystEssentialsTests
//
//  Created by Andrew Kuzmich on 20.06.2023.
//

import XCTest

final class StringProtocolExt: XCTestCase {

    func testSubscript() throws {
        let stringProtocol: any StringProtocol = "Hello world"
        XCTAssertEqual(stringProtocol[charByIdx: 0],"H" )
//        XCTAssertEqual(stringProtocol[0..<5],"Hello" )
//        XCTAssertEqual(stringProtocol[NSRange(location: 0, length: 3)],"Hel" )
//        XCTAssertEqual(stringProtocol[NSRange(location: 0, length: 3)],"Hel" )
//        XCTAssertEqual(stringProtocol[0..<4],"Hel" )
        
        
    }


}
