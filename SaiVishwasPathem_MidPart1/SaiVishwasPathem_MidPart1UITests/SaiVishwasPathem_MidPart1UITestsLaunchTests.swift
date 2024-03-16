//
//  SaiVishwasPathem_MidPart1UITestsLaunchTests.swift
//  SaiVishwasPathem_MidPart1UITests
//
//  Created by Sai Vishwas Pathem on 3/5/24.
//

import XCTest

final class SaiVishwasPathem_MidPart1UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
