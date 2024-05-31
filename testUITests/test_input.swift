//
//  testUITestsLaunchTests.swift
//  testUITests
//
//  Created by apple on 5/20/24.
//

import XCTest

final class testUITestsInput: XCTestCase {
    
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
        
        // 元素 input
        let el_input = app.buttons["input"]
        XCTAssertTrue(el_input.exists, "Element: Input does not exist")
        guard el_input.exists else {
            return
        }
        el_input.tap()
        
        // 输入框 TextFields
        let username = app.textFields["username"]
        username.tap()
        username.typeText("apple")
        
        // 隐藏键盘
        let el_keyboard = app.keyboards.element
        if el_keyboard.exists {
            app.typeText("\n")
        }
        
        // 文档：https://developer.apple.com/documentation/xctest/xcuielement
//        app.swipeLeft(velocity: 10)
//        app.swipeRight(velocity: 10)
        
        // 返回到上个页面
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
//        Thread.sleep(forTimeInterval: 30)
        
    }
}
