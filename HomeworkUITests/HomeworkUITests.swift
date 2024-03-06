//
//  HomeworkUITests.swift
//  HomeworkUITests
//
//  Created by Darius Miskinis on 2024-03-02.
//

import XCTest

final class HomeworkUITests: XCTestCase {

    private let app = XCUIApplication()

    override func setUpWithError() throws {
        app.launchArguments.append("--MockNetworkResponses")
        app.launch()
        continueAfterFailure = false
    }

    func testDadJokeFlow() throws {
        let triggerButton = app.buttons["dadJokeButton"]
        XCTAssertTrue(triggerButton.exists)
        triggerButton.tap()

        let resultLabel = app.staticTexts["textLabel"]
        let resultExists = resultLabel.waitForExistence(timeout: 5)

        XCTAssertTrue(resultExists, "The result label did not appear in time.")
        XCTAssertEqual(resultLabel.label, "Mocked dad joke")
    }

    func testChuckNorrisFactFlow() throws {
        let triggerButton = app.buttons["chuckNorrisFactButton"]
        XCTAssertTrue(triggerButton.exists)
        triggerButton.tap()

        let resultLabel = app.staticTexts["textLabel"]
        let resultExists = resultLabel.waitForExistence(timeout: 5)

        XCTAssertTrue(resultExists, "The result label did not appear in time.")
        XCTAssertEqual(resultLabel.label, "Mocked Chuck Norris fact")
    }
}
