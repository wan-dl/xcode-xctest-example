//
//  testUITestsLaunchTests.swift
//  testUITests
//
//  Created by apple on 5/20/24.
//

import XCTest

final class testUITestsUniApp: XCTestCase {
    
    var app: XCUIApplication!
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        app = XCUIApplication(bundleIdentifier: "uni.UNIB41E05C")
        app.launch()
    }

    func testInput() throws {
        // 输入框 TextFields
        let username = app.textFields["username"]
        username.tap()
        username.typeText("apple")
    }
}
