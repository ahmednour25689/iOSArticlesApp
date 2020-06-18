//
//  NetworkLayerTests.swift
//  NetworkLayerTests
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import XCTest
@testable import NetworkLayer

class NetworkLayerTests: XCTestCase {
  //Mark : Url Parts
  let apiBaseUrl = "api.nytimes.com"
  let getNewsPath = "/svc/mostpopular/v2/viewed/1.json"
  let wrongApiPath = "/svc/mostpopular/v2/viewed/1."
  let parameters : [String : String] =  ["api-key" : "jCMYgbYCbRPGDwkDKjb9Avhj41E1MVGn"]
  //Mark:- Variables
  var networkManager : NetworkManager<Response>?
  override func setUp() {
  }
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func test_NetworkManager_WhenIntialized_NotNull() {
    createValidNetworkManagerInstance()
    XCTAssertNotNil(networkManager, "network manager not initialized")
  }
  func test_GetData_WhenInvalidUrl_RetrunsError() {
    createInValidNetworkManagerInstance()
    let expectation = XCTestExpectation(description: "get data")
    networkManager?.getData(completion: {
      result in
      switch result {
      case .success :
        XCTFail("response returned")
      case .failure(let error):
        XCTAssertNotNil(error, "error not generated")
        expectation.fulfill()
      }
    })
    wait(for: [expectation], timeout: 10.0)
  }
  func test_GetData_WhenValidUrl_RetrunsResponse() {
    createValidNetworkManagerInstance()
    let expectation = XCTestExpectation(description: "get data")
    networkManager?.getData(completion: {
      result in
      switch result {
      case .success(let response) :
        XCTAssertNotNil(response, "No data was downloaded.")
        expectation.fulfill()
      case .failure:
        XCTFail("error returned")

      }
    })
    wait(for: [expectation], timeout: 10.0)
  }
  func createValidNetworkManagerInstance(){
    networkManager = NetworkMangerInterface.createNetworkMangerInstance(baseUrl: apiBaseUrl, path: getNewsPath, params: parameters)
  }
  func createInValidNetworkManagerInstance(){
    networkManager = NetworkMangerInterface.createNetworkMangerInstance(baseUrl: apiBaseUrl, path: wrongApiPath, params: parameters)
  }
}
