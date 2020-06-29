//
//  FactViewModel.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import Foundation

typealias GetFactsDataCompletionHandler = (Result<Facts, Error>) -> Void

class FactsViewModel: NSObject {
  private var countryFacts: Facts?
  private var factsService: FactsServiceRequests?

  override init() {
    super.init()
    factsService = FactsServiceRequests()
  }

  // Get Fact Row for given index
  func getRow(at index: Int) -> Row? {
    let rows  = countryFacts?.rows?.filter { row in
      return (row.title != nil || row.description != nil) }
    return rows?[index]
  }

  // Number of Facts Items
  func numberOfRows() -> Int {
    let items  = countryFacts?.rows?.filter { row in
      return (row.title != nil || row.description != nil) }
    return items?.count ?? 0
  }

  // fetch request for country facts
  func requestData(completion: @escaping GetFactsDataCompletionHandler) {
    if Reachability.isConnectedToNetwork() == false {
      completion(Result.failure(NetworkError.custom(Message.networkNotReachable.value)))
      return
    }
    factsService?.getFactsData(completion: { [weak self] apiResult in
      guard let this = self else { return }
      switch apiResult {
      case .success(let factsList):
        this.countryFacts = factsList
        completion(Result.success(factsList))
      case .failure(let error):
        completion(Result.failure(error))
      }
    })
  }
}
