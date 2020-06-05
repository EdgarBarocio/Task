//
//  SpyClasses.swift
//  GifSearcherTests
//
//  Created on 6/5/20.
//

import Foundation
@testable import GifSearcher

class SearchPresenterDisplayLogicSpy: SearchPresentationLogic {
    
    //MARK: - Expectation
    var presentGifsCalled = false
    
    //MARK: - Argument expectations
    var viewModel: AnimatedGifSearch.Search.ViewModel!
    
    //MARK: - Spy
    func presentSearchResults(response: AnimatedGifSearch.Search.Response) {
        viewModel = AnimatedGifSearch.Search.ViewModel(searchResult: response.searchResult)
        presentGifsCalled = true
    }
}

class SearchViewControllerSpy: SearchDisplayLogic {
    //MARK: - Expectation
    var displayGifsCalled = false
    
    //MARK: - Spy
    func displayAnimatedGifs(viewModel: AnimatedGifSearch.Search.ViewModel) {
        displayGifsCalled = true
    }
}

class SearchInteractorSpy: SearchBusinessLogic {
    //MARK: - Expectation
    var searchGifsCalled = false
    
    //MARK: - Spy
    func performGifSearch(request: AnimatedGifSearch.Search.Request) {
        searchGifsCalled = true
    }
}

class SearchWorkerSpy: SearchWorkerProtocol {
    var serviceCallMade = false
    
    //MARK: - Spy
    func performSearch(searchTerm: String, completionHandler: @escaping ([AnimatedGif]) -> Void) {
        serviceCallMade = true
    }
}
