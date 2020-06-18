//
//  PopularArticleViewModelTests.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

@testable import NyTimesPopularArticles
import XCTest
class PopularArticleViewModelTests: XCTestCase {
    var viewModel: MostPopularArticlesViewModel?
    var results: [Serializable] = []
    var error: Serializable?
    let expectation = XCTestExpectation(description: "get Valid data")
    let errorExpectation = XCTestExpectation(description: "get Error Response")
    func test_ViewModel_ViewTitle_IsCorrect() {
        createViewModelInstance()
        XCTAssertEqual(viewModel!.viewtitle, "NY Times Most Popular")
    }

    func test_ViewModel_EstimatedRowHeight_IsCorrect() {
        createViewModelInstance()
        XCTAssertEqual(viewModel!.tableRowEstimatedHeight, 150)
    }

    func test_ViewModel_GetDataWithValidUrl_ReturnsData() {
        createViewModelInstance()
        let baseUrl = NetworkConstants.apiBaseUrl
        let apiPath = NetworkConstants.getNewsPath
        let parametes = ["api-key": Constants.apiKey]
        let apiComponent = ApiUrlComponent(baseurl: baseUrl, apiPath: apiPath, params: parametes)

        viewModel!.getData(with: apiComponent)
        wait(for: [expectation], timeout: 10.0)
        XCTAssertTrue(results.count > 0, "Not valid results")
    }

    func test_ViewModel_GetDataWithInValidUrlComponennts_ReturnsError() {
        createViewModelInstance()
        let baseUrl = NetworkConstants.apiBaseUrl
        let apiPath = NetworkConstants.getNewsPath
        let parametes = ["api-key": "apikey"]
        let apiComponent = ApiUrlComponent(baseurl: baseUrl, apiPath: apiPath, params: parametes)

        viewModel!.getData(with: apiComponent)
        wait(for: [errorExpectation], timeout: 10.0)
        XCTAssertNotNil(error, "error occured")
    }

    func createViewModelInstance() {
        viewModel = MostPopularArticlesViewModel(delegate: self)
    }
}

extension PopularArticleViewModelTests: ViewModelViewProtocol {
    func didGetDataWithSuccess(data: [Serializable]?) {
        results = data ?? []
        XCTAssertNotNil(data, "data is nil")
        expectation.fulfill()
    }

    func didFailedWithError(error: Serializable) {
        self.error = error
        errorExpectation.fulfill()
    }
}
