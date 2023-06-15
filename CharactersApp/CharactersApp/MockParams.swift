//
//  MockParams.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

class MockParams {
    static let data: CharacterResponse? = CharacterResponse(relatedTopics: [RelatedTopics(firstURL: "https://duckduckgo.com/Homer_Simpson",
                                                                      icon: Icon(height: "", url: "/i/bf0eb228.png", width: ""),
                                                                      result: "Homer Simpson Homer Jay Simpson is a fictional character and the main protagonist of the American animated sitcom The Simpsons. He is voiced by Dan Castellaneta and first appeared, along with the rest of his family, in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.",
                                                                      text: "Homer Simpson - Homer Jay Simpson is a fictional character and the main protagonist of the American animated sitcom The Simpsons. He is voiced by Dan Castellaneta and first appeared, along with the rest of his family, in The Tracey Ullman Show short \"Good Night\" on April 19, 1987."),
                                                        RelatedTopics(firstURL: "https://duckduckgo.com/Lisa_Simpson",
                                                                      icon: Icon(height: "", url: "/i/0c6d3b53.png", width: ""),
                                                                      result: "Lisa Simpson Lisa Marie Simpson is a fictional character in the animated television series The Simpsons. She is the middle child and most accomplished of the Simpson family. Voiced by Yeardley Smith, Lisa was born as a character in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.",
                                                                      text: "Lisa Simpson - Lisa Marie Simpson is a fictional character in the animated television series The Simpsons. She is the middle child and most accomplished of the Simpson family. Voiced by Yeardley Smith, Lisa was born as a character in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.")
    ])
    static let data1: RelatedTopics = RelatedTopics(firstURL: "https://duckduckgo.com/Homer_Simpson",
                                     icon: Icon(height: "", url: "/i/bf0eb228.png", width: ""),
                                     result: "Homer Simpson Homer Jay Simpson is a fictional character and the main protagonist of the American animated sitcom The Simpsons. He is voiced by Dan Castellaneta and first appeared, along with the rest of his family, in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.",
                                     text: "Homer Simpson - Homer Jay Simpson is a fictional character and the main protagonist of the American animated sitcom The Simpsons. He is voiced by Dan Castellaneta and first appeared, along with the rest of his family, in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.")
    static let data2 =  RelatedTopics(firstURL: "https://duckduckgo.com/Lisa_Simpson",
                                      icon: Icon(height: "", url: "", width: ""),
                                      result: "Lisa Simpson Lisa Marie Simpson is a fictional character in the animated television series The Simpsons. She is the middle child and most accomplished of the Simpson family. Voiced by Yeardley Smith, Lisa was born as a character in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.",
                                      text: "Lisa Simpson - Lisa Marie Simpson is a fictional character in the animated television series The Simpsons. She is the middle child and most accomplished of the Simpson family. Voiced by Yeardley Smith, Lisa was born as a character in The Tracey Ullman Show short \"Good Night\" on April 19, 1987.")
}

struct MockRequest: Requestable {
    
}

struct MockApiManager: ApiManagerContract {
    
    let responseData: Data?
    let error: Error?
    
    init(responseData: Data? = nil, error: Error? = nil) {
        self.responseData = responseData
        self.error = error
    }
    
    func restApi(_ request: Requestable) async throws -> Data {
        if let error = error {
            throw error
        }
        guard let responseData = responseData else {
            throw NSError(domain: "TestError", code: 456, userInfo: nil)
        }
        return responseData
    }
}

extension CharacterResponse {
    func toData() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(self)
    }
}
