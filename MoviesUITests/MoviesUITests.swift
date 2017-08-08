//
//  MoviesUITests.swift
//  MoviesUITests
//
//  Created by Rob Gilbert on 8/3/17.
//  Copyright © 2017 Rob Gilbert. All rights reserved.
//

import XCTest

class MoviesUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        XCUIApplication().launch()
        // Put setup code here. This method is called before the invocation of each test method in the
    }
    
    func testGenreField() {
        XCUIApplication().navigationBars["Movies"].buttons["Add"].tap()
        
        XCUIApplication().textFields["Name"].tap()
        XCUIApplication().textFields["Name"].typeText("Cool Runnings")

        XCUIApplication().textFields["Year"].tap()
        XCUIApplication().textFields["Year"].typeText("1989")

        XCUIApplication().textFields["Director"].tap()
        XCUIApplication().textFields["Director"].typeText("Bruce")

        XCUIApplication().textFields["Rating"].tap()
        XCUIApplication().textFields["Rating"].typeText("R")

        XCUIApplication().textFields["Genre"].tap()
        XCUIApplication().textFields["Genre"].typeText("Comedy")

        XCUIApplication().buttons["Done"].tap()
        
        
        XCTAssert(XCUIApplication().staticTexts["Comedy"].exists)
        
        
        
    }
    
}
