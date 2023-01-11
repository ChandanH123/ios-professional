//
//  LoginViewControllerTests.swift
//  BankeyUnitTests
//
//  Created by Chandan on 11/01/23.
//

import Foundation
import XCTest

@testable import Bankey

class LoginViewControllerTests: XCTestCase {
    
    var loginViewController = LoginViewController()
    
    override func setUp() {
        super.setUp()
        loginViewController.loadViewIfNeeded()
    }
    
    func testViewShouldLoad() throws {
        XCTAssertTrue(loginViewController.isViewLoaded)
    }
}
