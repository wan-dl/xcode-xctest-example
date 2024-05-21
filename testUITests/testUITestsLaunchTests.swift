//
//  testUITestsLaunchTests.swift
//  testUITests
//
//  Created by hx on 5/20/24.
//

import XCTest

final class testUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication(bundleIdentifier: "io.dcloud.uniappx")
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
        
//        let username = app.textFields["username"]
//        username.tap()
//        username.typeText("apple")
//        
//        let passwd = app.textFields["password"]
//        passwd.tap()
//        passwd.typeText("1234567")
//        
//        let btn = app.buttons["Login"]
//        XCTAssertTrue(btn.exists, "Login Button does not exist")
//        btn.tap()
        
        
        
        
    }
}
