//
//  EndPoints.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

//https://api.duckduckgo.com/?q=simpsons+characters&format=json
//
//https://api.duckduckgo.com/?q=the+wire+characters&format=json

enum EnvironmentKeys {
    case ServerURL
    case ParamName
    
    func value() -> String {
        switch self {
        case .ServerURL:
            return "Base_Url"
        case .ParamName:
            return "Param_Name"
        }
    }
}

class Environment {
    
    static let shared = Environment()
    private init() {}
    
    private var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            }else {
                fatalError("Plist file not found")
            }
        }
    }

    var serverUrl: String {
        return "https://duckduckgo.com"
    }
    
    var paramName: String {
        return infoDict[EnvironmentKeys.ParamName.value()] as! String
    }
}
