//
//  CharactersAppTests.swift
//  CharactersAppTests
//
//  Created by Kevin Verghese on 6/14/23.
//

import XCTest
@testable import CharactersApp

//class CharacterViewModelTests: XCTestCase {
//
//    var viewModel: CharacterViewModel!
//
//    override func setUpWithError() throws {
//        try super.setUpWithError()
//        viewModel = CharacterViewModel()
//    }
//
//    override func tearDownWithError() throws {
//        viewModel = nil
//        try super.tearDownWithError()
//    }
//
//    func testGetCharacters_Success() {
//        // Given
//        let request = MockRequest()
//        let expectedResponse = MockParams.data
//        let apiManager = MockApiManager(responseData: expectedResponse!.toData())
//        viewModel = CharacterViewModel(apiManager: apiManager)
//
//        // When
//        viewModel.getCharacters(request)
//
//        // Then
//        XCTAssertEqual(viewModel.state, .showList)
//        XCTAssertEqual(viewModel.response?.relatedTopics.count, 1)
//        XCTAssertEqual(viewModel.searchedChars.count, 1)
//        XCTAssertEqual(viewModel.searchedChars.first?.text, "Character 1")
//    }
//
//    func testGetCharacters_Failure() {
//        // Given
//        let request = MockRequest()
//        let expectedError = NSError(domain: "TestError", code: 123, userInfo: nil)
//        let apiManager = MockApiManager(error: expectedError)
//        viewModel = CharacterViewModel(apiManager: apiManager)
//
//        // When
//        viewModel.getCharacters(request)
//
//        // Then
//        XCTAssertEqual(viewModel.state, .showError(expectedError.localizedDescription))
//        XCTAssertNil(viewModel.response)
//        XCTAssertTrue(viewModel.searchedChars.isEmpty)
//    }
//
//    func testRetrieveText() {
//        // Given
//        let character = MockParams.data1
//        viewModel.searchedChars = [character] as [RelatedTopics]
//
//        // When
//        let result = viewModel.retrieveText(0)
//
//        // Then
//        XCTAssertEqual(result, ["Character", "Details"])
//    }
//
//    func testPrepareCharInfo() {
//        // Given
//        let character = MockParams.data1
//        viewModel.searchedChars = [character] as [RelatedTopics]
//
//        // When
//        let result = viewModel.prepareCharInfo(0)
//
//        // Then
//        XCTAssertEqual(result.imageURL, URL(string: "https://example.com/image.png"))
//        XCTAssertEqual(result.title, "Character")
//        XCTAssertEqual(result.description, "Details")
//    }
//
//    func testFetchCharImageURL_WithEmptyURL() {
//        // Given
//        let character = MockParams.data2
//        viewModel.searchedChars = [character] as [RelatedTopics]
//
//        // When
//        let result = viewModel.fetchCharImageURL(0)
//
//        // Then
//        XCTAssertNil(result)
//    }
//
//    func testFetchCharImageURL_WithValidURL() {
//        // Given
//        let character = MockParams.data1
//        viewModel.searchedChars = [character] as [RelatedTopics]
//
//        // When
//        let result = viewModel.fetchCharImageURL(0)
//
//        // Then
//        XCTAssertEqual(result, URL(string: "https://example.com/image.png"))
//    }
//
//    func testSearchChar_WithEmptySearchText() {
//        // Given
//        let character = MockParams.data1
//        viewModel.response = MockParams.data
//
//        // When
//        viewModel.searchChar(searchText: "")
//
//        // Then
//        XCTAssertEqual(viewModel.searchedChars.count, 1)
//        XCTAssertEqual(viewModel.searchedChars.first?.text, "Character 1")
//    }
//
//    func testSearchChar_WithValidSearchText() {
//        // Given
//        let character1 = MockParams.data1
//        let character2 = MockParams.data2
//        viewModel.response = MockParams.data
//
//        // When
//        viewModel.searchChar(searchText: "2")
//
//        // Then
//        XCTAssertEqual(viewModel.searchedChars.count, 1)
//        XCTAssertEqual(viewModel.searchedChars.first?.text, "Character 2")
//    }
//
//}
//
//
