//
//  test_slider.swift
//  testUITests
//
//  Created by apple on 5/29/24.
//

import XCTest

final class test_slider: XCTestCase {
    
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
        let el = app.buttons["slider"]
        XCTAssertTrue(el.exists, "Element: el does not exist")
        guard el.exists else {
            return
        }
        el.tap()
        
        
        let slider = app.sliders["SpeedSlider"]
        let text = app.staticTexts["SpeedText"]
       
        // Initial value test
        XCTAssertTrue(text.label.contains("50"), "初始值包含50")

        // Interact with the slider
        slider.adjust(toNormalizedSliderPosition: 0.75) // Set slider to 75%

        // Check the new value and color while editing
        XCTAssertTrue(text.label.contains("75"), "调整值包含75")
        
    }
}
