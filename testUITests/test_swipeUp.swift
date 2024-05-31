//
//  test_swipeUp.swift
//  testUITests
//
//  Created by apple on 5/31/24.
//

import XCTest

final class test_swipeUp: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // 点击tabbar，切换到test页面
        let tabElement = app.tabBars.buttons["Test"]
        XCTAssertTrue(tabElement.exists, "Element: tabbars.Test does not exist")
        tabElement.tap()
        
        // 进入测试页面
        let el = app.buttons["swipe-up"]
        XCTAssertTrue(el.exists, "Element: el does not exist")
        guard el.exists else {
            return
        }
        el.tap()
        
        app.swipeDown(velocity: 500.0)
        app.swipeDown(velocity: XCUIGestureVelocity.fast)
        
        let tablesQuery = app.staticTexts["刷新次数"]
        tablesQuery.swipeUp(velocity: .fast)
//        let start = tablesQuery.coordinate(withNormalizedOffset:  CGVector(dx: 0.0, dy: 0.0))
//        let finish = tablesQuery.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 3.0))
//        start.press(forDuration: 0.5, thenDragTo: finish)
        
        Thread.sleep(forTimeInterval: 30)
        
    }
}
