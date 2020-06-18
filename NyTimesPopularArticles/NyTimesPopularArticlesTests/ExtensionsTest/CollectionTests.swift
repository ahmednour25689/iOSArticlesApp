//
//  CollectionTests.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

@testable import NyTimesPopularArticles
import XCTest
class CollectionTests: XCTestCase {
    let dataArray = [1, 2, 3]

    func test_CollectionExtension_WhenAccessInvalidIndex_returnNil() {
        XCTAssertNil(dataArray[safe: 5], "Not returning nil")
    }

    func test_CollectionExtension_WhenAccessValidIndex_returnValue() {
        XCTAssertNotNil(dataArray[safe: 0], " returning nil")
    }
}
