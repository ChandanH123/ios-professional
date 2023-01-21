//
//  AccountTests.swift
//  BankeyUnitTests
//
//  Created by Chandan on 21/01/23.
//

import Foundation

@testable import Bankey
import XCTest

class AccountTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
          [{
            "id": "2",
            "type": "Banking",
            "name": "All-In Chequing",
            "amount": 200.00,
            "createdDateTime" : "2023-01-21T15:29:32Z"
          }]
        """
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let result = try! decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result.count, 1)
        
        let account = result[0]
        
        XCTAssertEqual(account.id, "2")
        XCTAssertEqual(account.type, .Banking)
        XCTAssertEqual(account.name, "All-In Chequing")
        XCTAssertEqual(account.amount, 200.00)
        XCTAssertEqual(account.createdDateTime.monthDayYearString, "Jan 21, 2023")
    }
}
