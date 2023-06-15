//
//  Request.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

protocol Requestable {
    var baseUrl: String {get}
    var path: String {get}
    var params: [String: String] {get}
    var type: String {get}
    var header: [String: String] {get}
    func createUrlRequest() -> URLRequest?
}

extension Requestable {
    var baseUrl: String {
        return "https://api.duckduckgo.com/"
    }
    var path: String {
        return ""
    }
    var params: [String: String] {
        return [:]
    }
    var type: String {
        return "GET"
    }
    var header: [String: String] {
        return [:]
    }
    
    func createUrlRequest() -> URLRequest? {

        var urlComponnets = URLComponents(string: baseUrl + path)
        
        urlComponnets?.scheme = "https"
        if type == "GET" {
            var queryItems: [URLQueryItem] = []
            for (key, value) in params {
                queryItems.append( URLQueryItem(name: key, value: value))
            }
            urlComponnets?.queryItems = queryItems
        }
      
       
        guard let url = urlComponnets?.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = type
        if type == "POST" {
            let jsonData = try? JSONEncoder().encode(params)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
        }
        return urlRequest
    }
}

