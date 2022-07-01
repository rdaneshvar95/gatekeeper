//
//  GateKeeperTests.swift
//  GateKeeperTests
//
//  Created by Ray on 01/07/22.
//

import XCTest
@testable import GateKeeper

class GateKeeperTests: XCTestCase {

    func testMainPresenterEmptyUsername() {
        XCTAssertThrowsError(try MainPresenter().validate(username: "", password: "")) { error in
            XCTAssertEqual(error as? LoginError, LoginError.emptyUsername)
        }
    }
    
    func testMainPresenterWrongPassword() {
        XCTAssertThrowsError(try MainPresenter().validate(username: "asdf", password: "")) { error in
            XCTAssertEqual(error as? LoginError, LoginError.wrongPassword)
        }
    }
    
    func testMainPresenterCorrectPassword() {
        XCTAssertNoThrow(try MainPresenter().validate(username: "asdf", password: "password"))
    }
}
