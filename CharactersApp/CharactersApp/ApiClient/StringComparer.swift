//
//  StringComparer.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import Foundation

class StringComparer {
    
    func match(words: [[Character]], text: [Character]) -> Bool {
        resetLPS(words: words)
        var result = true
        for word in words {
            buildLPS(word: word)
            if !match(word: word, text: text) {
                result = false
            }
        }
        return result
    }
    
    private func match(word: [Character], text: [Character]) -> Bool {
        var i = 0
        var j = 0
        while i < text.count {
            if text[i] == word[j] {
                i += 1
                j += 1
            }
            if j == word.count {
                return true
            }
            
            if i < text.count && text[i] != word[j] {
                if j != 0 {
                    j = lps[j - 1]
                } else {
                    i += 1
                }
            }
        }
        return false
    }
    
    private var lps = [Int]()
    
    private func resetLPS(words: [[Character]]) {
        var longestWordLength = 0
        for word in words {
            if word.count > longestWordLength {
                longestWordLength = word.count
            }
        }
        
        if lps.count < longestWordLength {
            let newSize = longestWordLength + longestWordLength / 2 + 1
            lps = [Int](repeating: 0, count: newSize)
        } else {
            for index in 0..<longestWordLength {
                lps[index] = 0
            }
        }
    }
    
    private func buildLPS(word: [Character]) {
        var i = 1
        var len = 0
        while i < word.count {
            if word[i] == word[len] {
                len += 1
                lps[i] = len
                i += 1
            } else if len != 0 {
                len = lps[len - 1]
            } else {
                lps[i] = 0
                i += 1
            }
        }
    }
}
