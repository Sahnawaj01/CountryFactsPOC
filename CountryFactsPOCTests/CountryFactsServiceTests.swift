//
//  CountryFactsPOCTests.swift
//  CountryFactsPOCTests
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import XCTest
@testable import CountryFactsPOC

// Test cases class for executing test cases
class CountryFactsPOCTests: XCTestCase {
    var factRequest: FactsServiceRequests!

    // Initialization of instances
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        factRequest = FactsServiceRequests()
    }

    // Tear down methode invoked after the code executes
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        factRequest = nil
    }

    // Verify api call
    func testApiResponse() {
        let expectations = expectation(description: "API Service Response")
        factRequest.getFactsData(completion: { apiResult in
            switch apiResult {
            case .failure(_) :
                XCTAssert(false, "Response data failed")
            default:
                break
            }
            expectations.fulfill()
        })
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
