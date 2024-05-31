//
//  testUITestsLaunchTests.swift
//  testUITests
//
//  Created by apple on 5/20/24.
//

import XCTest

final class testUITestsBtn: XCTestCase {
    
    var app: XCUIApplication!
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    func testInput() throws {
        // 点击tabbar，切换到test页面
        let tabElement = app.tabBars.buttons["Test"]
        XCTAssertTrue(tabElement.exists, "Element: tabbars.Test does not exist")
        tabElement.tap()
        
        // 元素 button
        let el_input = app.buttons["Open"]
        XCTAssertTrue(el_input.exists, "Element: Input does not exist")
        guard el_input.exists else {
            return
        }
        el_input.tap()
        
    }
}
