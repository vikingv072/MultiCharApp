//
//  CharacterResponse.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

struct CharacterResponse: Codable {
    let relatedTopics: [RelatedTopics]
    private enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

struct RelatedTopics: Codable {
    let firstURL: String
    let icon: Icon
    let result: String
    let text: String
    
    private enum CodingKeys: String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

struct Icon: Codable {
    let height: String
    let url: String
    let width: String
    
    private enum CodingKeys: String, CodingKey {
        case height = "Height"
        case url = "URL"
        case width = "Width"
    }
}
