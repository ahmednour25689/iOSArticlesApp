//
//  TableDataSourcesTests.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

@testable import NyTimesPopularArticles
import XCTest

class TableDataSourcesTests: XCTestCase {
    let serializableData = [SerializableItem(id: 0)]
    var dataSource: TableDataSourceProvider?

    func test_DataSource_WhenIntialized_NotNull() {
        createDataSourceInstance()
        XCTAssertNotNil(dataSource, "data source is nil")
    }

    func createDataSourceInstance() {
        let dataManager = DataManager(dataItems: serializableData)
        dataSource = TableDataSourceProvider(dataManager: dataManager, apiCaller: self)
    }
}

extension TableDataSourcesTests: ApiCalling {
    func callApi() {}
}
