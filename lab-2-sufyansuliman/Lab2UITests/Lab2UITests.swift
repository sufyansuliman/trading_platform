//
//  Lab2UITests.swift
//  Lab2UITests
//
//  Created by Shyam Kumar on 9/17/21.
//

import XCTest

class Lab2UITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testUI() {
        app.launch()
        checkUIElements()
        checkSpacesNameEntry()
        checkNameEntry()
    }
    
    func checkUIElements() {
        XCTAssertTrue(app.isDisplayingNameLabel)
        XCTAssertTrue(app.isDisplayingNameText)
        XCTAssertTrue(app.isDisplayingEnterButton)
    }
    
    func checkNameEntry() {
        typeStringIntoTextField(str: "Test")
        let nameLabel = app.staticTexts["nameLabel"]
        XCTAssertEqual(nameLabel.label, "Hi, Test")
    }
    
    func checkSpacesNameEntry() {
        typeStringIntoTextField(str: "     ")
        let nameLabel = app.staticTexts["nameLabel"]
        XCTAssertEqual(nameLabel.label, "What's your name?")
    }
    
    func typeStringIntoTextField(str: String) {
        app.textFields.element.tap()
        app.textFields.element.typeText(str)
        app.buttons["enterButton"].tap()
    }
}

extension XCUIApplication {
    var isDisplayingNameLabel: Bool {
        return staticTexts["nameLabel"].exists
    }
    
    var isDisplayingNameText: Bool {
        return textFields["nameText"].exists
    }
    
    var isDisplayingEnterButton: Bool {
        return buttons["enterButton"].exists
    }
}
