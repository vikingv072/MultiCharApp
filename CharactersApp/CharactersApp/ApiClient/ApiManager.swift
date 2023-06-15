//
//  ApiManager.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

protocol ApiManagerContract {
    func restApi(_ request: Requestable) async throws -> Data
}

struct ApiManager {
    private let urlSession: URLSession
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension ApiManager: ApiManagerContract {
    func restApi(_ request: Requestable) async throws -> Data {
        guard let urlRequest = request.createUrlRequest() else {
            throw ApiCallError.invalidRequest
        }
        let (data, response) = try await urlSession.data(for: urlRequest, delegate: nil)
        if  response.isValidResponse() {
            return data
        } else {
            throw ApiCallError.invalidResponse
        }
    }
}

extension URLResponse {
    func isValidResponse()-> Bool {
        guard let response = self as? HTTPURLResponse else {
            return false
        }
        switch response.statusCode {
        case 200...299:
          return true
        default:
          return false
        }
    }
}
