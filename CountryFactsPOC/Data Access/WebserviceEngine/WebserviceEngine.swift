//
//  WebserviceEngine.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 29/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case incorrectData(Data)
    case incorrectURL
    case unknown
    case custom(String)
}

typealias WebServiceCompletionBlock = (Result<Data, Error>) -> Void

// Helper class to prepare request(adding headers & clubbing base URL) & perform API request.
struct WebserviceEngine {
    // Performs a API request which is called by any service request class.
    // It also performs an additional task of validating the auth token and refreshing if necessary
    //
    // - Parameters:
    //   - apiModel: APIModelType which contains the info about api endpath, header & http method type.
    //   - completion: Request completion handler.
    // - Returns: Returns a URLSessionDataTask instance.
    @discardableResult public func requestAPI(apiModel: APIModelType, completion: @escaping WebServiceCompletionBlock) -> URLSessionDataTask? {

        let request = self.buildRequest(from: apiModel)

        let task = URLSession.shared.dataTask(with: request) { responseData, response, error in
            let jsonString = String(data: responseData!, encoding: .ascii)
            guard let newData = jsonString?.data(using: .utf8, allowLossyConversion: true) else {
                return
            }
            if let httpStatus = response as? HTTPURLResponse,  ![200, 201].contains(httpStatus.statusCode) {
                completion(.failure(NetworkError.incorrectData(newData)))
            }
            completion(.success(newData))

        }
        task.resume()
        return task
    }

    fileprivate func buildRequest(from apiModel: APIModelType) -> URLRequest {
        let escapedAddress: String =  (apiModel.api.apiBasePath()+apiModel.api.apiEndPath()).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        var request = URLRequest(url: URL(string: escapedAddress)!,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)

        request.httpMethod = apiModel.api.httpMthodType().rawValue
        request.allHTTPHeaderFields = WebserviceConfig().generateHeader()
        if let params = apiModel.parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: params as Any, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return request
    }

}
