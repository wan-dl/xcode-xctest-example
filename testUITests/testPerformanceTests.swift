//
//  testPerformanceTests.swift
//  testUITests
//
//  Created by apple on 5/22/24.
//

import XCTest

final class PerformanceTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        XCUIApplication(bundleIdentifier: "io.dcloud.uniappx").terminate()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // 文档: https://developer.apple.com/documentation/xctest/performance_tests
            measure(metrics: [
                XCTClockMetric(),
                XCTApplicationLaunchMetric(),
                XCTMemoryMetric(),
                XCTCPUMetric()
            ]) {
                XCUIApplication(bundleIdentifier: "io.dcloud.uniappx").launch()
            }
        }
    }
}
