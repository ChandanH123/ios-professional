//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Chandan on 11/01/23.
//

import Foundation

import XCTest

@testable import Bankey

class CurrencyFormatterTests: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() { //everytime we run the test, this method setUp() is going to be called.
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testShouldBeVisible() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "$929,466.23")  // hardcoded the dollar sign here.
    }

    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "$0.00") // hardcoded the dollar sign here.
    }
    
    func testDollarsFormattedWithCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol! //$
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssertEqual(result, "\(currencySymbol)929,466.23")  // not hardcoded the dollar sign here.
    }
}
