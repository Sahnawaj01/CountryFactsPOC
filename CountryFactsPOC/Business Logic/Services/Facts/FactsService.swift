//
//  FactsService.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import Foundation

typealias FactsResponse = (Result<Facts, Error>) -> Void

protocol FactsServiceRequestType {
    @discardableResult func getFactsData(completion: @escaping FactsResponse) -> URLSessionDataTask?
}

struct FactsServiceRequests: FactsServiceRequestType {
    let router = WebserviceEngine()

    @discardableResult func getFactsData(completion: @escaping FactsResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: FactsAPI.factsList)
        return router.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let serverData):
                JSONResponseDecoder.decodeFrom(serverData, returningModelType: Facts.self, completion: { (allResponse, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }
                    if let factResponse = allResponse {
                        completion(.success(factResponse))
                        return
                    }
                })
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
