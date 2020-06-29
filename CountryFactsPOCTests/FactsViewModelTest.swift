//
//  FactsViewModelTest.swift
//  CountryFactsPOCTests
//
//  Created by Biswas, Mahammad Sahnawaj (Cognizant) on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import XCTest
@testable import CountryFactsPOC
class FactsViewModelTest: XCTestCase {
    
    var viewModel: FactsViewModel!
    //    var dataSource : GenericDataSource<Rows>!
    //    fileprivate var service : MockCurrencyService!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //        self.service = MockCurrencyService()
        //        self.dataSource = GenericDataSource<Rows>()
        self.viewModel = FactsViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.viewModel = nil
        //        self.dataSource = nil
        //        self.service = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testFetchWithNoService() {

        // giving no service to a view model
        viewModel.factsService = nil

        // expected to not be able to fetch currencies
        viewModel.requestData(completion: { apiResult in
            switch apiResult {
            case .success :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        })
    }
}
