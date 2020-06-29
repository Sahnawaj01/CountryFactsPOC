//
//  CountryFactsNetworkTest .swift
//  CountryFactsPOCTests
//
//  Created by Biswas, Mahammad Sahnawaj (Cognizant) on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import XCTest
@testable import CountryFactsPOC

class CountryFactsNetworkTest: XCTestCase {

   func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

   func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testInternetConnectivity() throws {
    let connectionStatus = Reachability.isConnectedToNetwork()
    XCTAssertTrue(connectionStatus)
  }
}
