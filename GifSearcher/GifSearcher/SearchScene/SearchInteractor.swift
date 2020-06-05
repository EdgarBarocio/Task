//
//  SearchInteractor.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import UIKit

/**
    Protocol to do a search for a term
 */
protocol SearchBusinessLogic {
    func performGifSearch(request: AnimatedGifSearch.Search.Request)
}

/**
    Protocol to allow for data passing between views or scenes
 */
protocol SearchDataStore {
    //var songs: [AnimatedGif]? { get }
}

/**
 Interactor class of the VIP Clean-Swift architecture
 
 This class implementes actions, action implemented is Gif Search. Class instantiates a worker in charge of
 making the service call and parsing of the service, then grabs the response and sends it to the presentation
 protocol
 */
class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    var presenter: SearchPresentationLogic?
    var worker: SearchWorker?
    var gifs: [AnimatedGif]?
    
    // MARK: Fetch images
    
    /**
        Instantiate the Worker to perform a search. The search closure grabs parsed results and passes them to the view using
        the presentation protocol.
     
     - Parameter request: Search term as a search request model
     */
    func performGifSearch(request: AnimatedGifSearch.Search.Request) {
        worker = SearchWorker()
        worker?.performSearch(searchTerm: request.searchTerm) { [weak self] (gifs) -> Void in
            guard let self = self else { return }
            
            self.gifs = gifs
            let response = AnimatedGifSearch.Search.Response(searchResult: self.gifs)
            self.presenter?.presentSearchResults(response: response)
        }
    }
    
}
