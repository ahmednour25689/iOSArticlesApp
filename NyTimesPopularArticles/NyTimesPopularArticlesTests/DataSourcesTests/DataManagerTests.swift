//
//  DataManagerTests.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
@testable import NyTimesPopularArticles
import XCTest

class DataManagerTests: XCTestCase {
    let serializableData = [SerializableItem(id: 0)]
    var dataManager: DataManager?
    func test_DataManager_WhenIntialized_NotNull() {
        createDataManagerInstance()
        XCTAssertNotNil(dataManager, "data manager is nil")
    }

    func test_DataManager_WhenIntialized_ItemCountCorrect() {
        createDataManagerInstance()
        XCTAssertEqual(dataManager!.itemsCount!, serializableData.count)
    }

    func createDataManagerInstance() {
        dataManager = DataManager(dataItems: serializableData)
    }
}
