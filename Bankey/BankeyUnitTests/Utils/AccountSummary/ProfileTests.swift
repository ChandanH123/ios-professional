//
//  ProfileTests.swift
//  BankeyUnitTests
//
//  Created by Chandan on 21/01/23.
//

import Foundation

@testable import Bankey
import XCTest

class ProfileTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
        {
            "id": "2",
            "first_name": "Allan",
            "last_name": "Bradley"
        }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id, "2")
        XCTAssertEqual(result.firstName, "Allan")
        XCTAssertEqual(result.lastName, "Bradley")
    }
}
