//
//  CharacterViewModel.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation


enum CharacterViewStates: Equatable {
    case showActivityIndicator
    case showList
    case showError(String)
    case none
}


final class CharacterViewModel {
    private let apiManager: ApiManagerContract
    
    @Published public var state: CharacterViewStates = .none
    
    var response: CharacterResponse?
    @Published var searchedChars = [RelatedTopics]()
    
    private let stringComparer = StringComparer()
    
    init(apiManager: ApiManagerContract = ApiManager()) {
        self.apiManager = apiManager
    }
    
    
    func getCharacters(_ request: Requestable) {
        Task {
            do {
                let data =  try await apiManager.restApi(request)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                response =  try decoder.decode(CharacterResponse.self, from: data)
                
                guard let charResponse = response else { return }
                searchedChars = charResponse.relatedTopics
                self.state = .showList
                
            } catch {
                state = .showError(error.localizedDescription)
            }
        }
    }
    
    func retrieveText(_ index: Int) -> [String] {
        let character = searchedChars[index]
        return character.text.components(separatedBy: "-")
    }
    
    func prepareCharInfo(_ index: Int) -> CharInfo {
        let recievedText = self.retrieveText(index)
        let imageURL = self.fetchCharImageURL(index)
        
        var descText = String()
        if recievedText.count > 2 {
            for text in recievedText {
                descText = descText + text
            }
        } else {
            descText = recievedText[1]
        }
        return (imageURL, recievedText[0], descText)
        
    }
    
    func fetchCharImageURL(_ index: Int) -> URL? {
        let character = searchedChars[index]
        if character.icon.url.isEmpty {
            return nil
        } else {
            let urlString = Environment.shared.serverUrl + character.icon.url
            return URL(string: urlString)
        }
    }
}

extension CharacterViewModel {
    
    func searchChar(searchText: String) {
        guard let chars = response?.relatedTopics else { return }
        let searchWords = searchText.split(separator: " ").map {
            $0.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        }
        guard searchWords.count > 0 else {
            searchedChars = chars
            return
        }
        let searchWordType = searchWords.map {
            Array($0)
        }
        searchedChars.removeAll(keepingCapacity: true)
        for char in chars {
            let search = "\(char.text.components(separatedBy: "-")[0].lowercased())"
            let searchArray = Array(search)
            if stringComparer.match(words: searchWordType, text: searchArray) {
                searchedChars.append(char)
            }
        }
    }
}
