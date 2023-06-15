//
//  ApiCallError.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

enum ApiCallError:Error {
    case invalidRequest
    case apiError
    case dataNotFound
    case responseError
    case parsingError
    case invalidResponse
}


