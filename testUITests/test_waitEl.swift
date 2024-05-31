//
//  testUITestsLaunchTests.swift
//  testUITests
//
//  Created by apple on 5/20/24.
//

import XCTest

final class testUITestsWaitElement: XCTestCase {
    
    var app: XCUIApplication!
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    func testWaitElement() throws {
        // 点击tabbar，切换到test页面
        let tabElement = app.tabBars.buttons["Test"]
        XCTAssertTrue(tabElement.exists, "Element: tabbars.Test does not exist")
        tabElement.tap()
        
        // 元素 input
        let el_input = app.buttons["input"]
        XCTAssertTrue(el_input.exists, "Element: Input does not exist")
        guard el_input.exists else {
            return
        }
        el_input.tap()
        
        // 等待元素
        let element = app.buttons["Login Btn"]
        if !element.waitForExistence(timeout: 10) {
            XCTFail("Element 'Login Btn' does not exist after waiting for 10 seconds")
        }
        
    }
}
