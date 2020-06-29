//
//  FactsRequestAPI.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import Foundation
//  This API will hold all APIs related to Facts
enum FactsAPI {
  // Get the list of facts
  case factsList
}

extension FactsAPI: APIProtocol {
  func httpMthodType() -> HTTPMethodType {
    var methodType = HTTPMethodType.get
    switch self {
    case .factsList:
      methodType = .get
    }
    return methodType
  }

  func apiEndPath() -> String {
    var apiEndPath = ""
    switch self {
    case .factsList:
      apiEndPath += "facts.json"
    }
    return apiEndPath
  }

  func apiBasePath() -> String {
    switch self {
    case .factsList:
      return WebserviceConstants.baseURL
    }
  }
}
