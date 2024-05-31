//
//  test_SwipeBack.swift
//  testUITests
//
//  Created by apple on 5/31/24.
//

import XCTest

final class test_SwipeBack: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    

    func testExample() throws {
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
        
        // 侧滑返回
        let start = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0.5))
        let end = app.coordinate(withNormalizedOffset: CGVector(dx: 1, dy: 0.5))
        start.press(forDuration: 0.1, thenDragTo: end)
        
        XCTAssertTrue(app.navigationBars["Test"].exists)
    }
}
