//
//  SpyClasses.swift
//  GifSearcherTests
//
//  Created on 6/5/20.
//

import Foundation
@testable import GifSearcher

struct GifSample {
    
    static let sampleGif = AnimatedGif(url: "http://media0.giphy.com/media/l4Ki5O9v4ZkNiTl7O/giphy.gif",
                                        urlSmall: "http://media.giphy.com/media/l4Ki5O9v4ZkNiTl7O/giphy-tumblr.gif")
}

class SearchPresenterSpy: SearchPresentationLogic {
    
    //MARK: - Expectation
    var presentGifsCalled = false
    
    //MARK: - Spy
    func presentSearchResults(response: AnimatedGifSearch.Search.Response) {
        presentGifsCalled = true
    }
}

class SearchViewControllerSpy: SearchDisplayLogic {
    //MARK: - Expectation
    var displayGifsCalled = false
    
    //MARK: - Argument expectations
    var viewModel: AnimatedGifSearch.Search.ViewModel!
    
    //MARK: - Spy
    func displayAnimatedGifs(viewModel: AnimatedGifSearch.Search.ViewModel) {
        self.viewModel = viewModel
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
