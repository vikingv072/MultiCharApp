//
//  CharacterRequest.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

struct CharacterRequest: Requestable {
    var params: [String : String] {
        return ["q":q, "format": "json"]
    }
    let q: String
}
