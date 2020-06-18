//
//  ConstantsUnitTest.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import XCTest
@testable import NyTimesPopularArticles
class ConstantsUnitTest: XCTestCase {
  let apiKey = "jCMYgbYCbRPGDwkDKjb9Avhj41E1MVGn"
  let invalidApiKey = "jCMYgbYCbRPGDwkDKjb9Avhj41E1MVGn"
  
  func test_Constants_ApiKeyValue_IsCorrect(){
    XCTAssertTrue(Constants.apiKey == self.apiKey, "Invalid api key")
  }
  func test_Constants_ApiKeyValue_IsWrong(){
     XCTAssertFalse(Constants.apiKey != self.invalidApiKey, "valid api key")
  }
   
}
