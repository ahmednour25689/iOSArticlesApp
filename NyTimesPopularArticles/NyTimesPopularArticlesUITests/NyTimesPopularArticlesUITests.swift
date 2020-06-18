//
//  NyTimesPopularArticlesUITests.swift
//  NyTimesPopularArticlesUITests
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import XCTest
@testable import NyTimesPopularArticles
class NyTimesPopularArticlesUITests: XCTestCase {
  var app: XCUIApplication!

    override func setUp() {
      super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMostPopularViewisFirsView() {

            app.launch()
            let isDisplayingMostPopularView = app.otherElements["MostPopularView"].exists
            XCTAssertTrue(isDisplayingMostPopularView)
            app.terminate()
    }
  func testViewTitleIsCorrect(){
    app.launch()
   let title = "NY Times Most Popular"
    XCTAssert(app.staticTexts[title].exists)

    app.terminate()
  }

}
