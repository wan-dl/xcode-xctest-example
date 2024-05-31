//
//  testUITestsLaunchTests.swift
//  testUITests
//
//  Created by apple on 5/20/24.
//

import XCTest

final class testUITestsScreenshot: XCTestCase {
    
    var app: XCUIApplication!
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }

    func testScreenshot() throws {
//        let screenshot = XCUIScreen.main.screenshot()
    }
}
