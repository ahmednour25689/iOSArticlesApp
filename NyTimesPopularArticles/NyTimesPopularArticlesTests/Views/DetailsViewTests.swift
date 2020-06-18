//
//  DetailsViewTests.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

@testable import NyTimesPopularArticles
import XCTest
class DetailsViewTests: XCTestCase {
    var detailsViewController: NewsDetailsViewController?
    override func setUp() {
        let results = ParseManager<Results>().parseAndLoadJson(filename: "Results")
        detailsViewController = NewsDetailsViewController(data: results!)
    }

    func test_ViewController_WhenIntialized_NotNull() {
        XCTAssertNotNil(detailsViewController, "null error")
    }

    func test_viewDidLoad_always_intializeData() {
        let viewController = detailsViewController!
        _ = viewController.view
        viewController.viewDidLoad()
        XCTAssertNotNil(detailsViewController?.view, "null error")
    }
}
