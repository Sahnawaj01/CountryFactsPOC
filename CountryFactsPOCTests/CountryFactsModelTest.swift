//
//  CountryFactsModelTest.swift
//  CountryFactsPOCTests
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import XCTest
@testable import CountryFactsPOC

class CountryFactsModelTest: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

  func testParseEmptyFacts() {

    // giving empty data
    let data = Data()

    // giving completion after parsing
    JSONResponseDecoder.decodeFrom(data, returningModelType: Facts.self, completion: { (allResponse, _) in
      if allResponse != nil {
        XCTAssert(false, "Expected failure when no data")
      }
    })
  }

  func testParseFacts() {
    // giving a sample json file
    if let url = Bundle.main.url(forResource: "sample", withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        JSONResponseDecoder.decodeFrom(data, returningModelType: Facts.self, completion: { (allResponse, error) in
          if error != nil {
            XCTAssert(false, "Expected valid Facts")
          }
          if let factResponse = allResponse {
            XCTAssertEqual(factResponse.title, "About Canada", "Expected About Canada")
            XCTAssertEqual(factResponse.rows!.count, 14, "Expected 14")
          }
        })
      } catch {
        XCTAssert(false, "Can't get data from sample.json")
      }
    }
  }

}
