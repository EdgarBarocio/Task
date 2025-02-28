//
//  SearchPresenter.swift
//  GifSearcher
//
//  Created  on 6/4/20.
//

import UIKit

/**
 Protocol to pass the search results to the view controller
 */
protocol SearchPresentationLogic {
    func presentSearchResults(response: AnimatedGifSearch.Search.Response)
}

/**
 Presenter class of the VIP Clean-Swift architecture.
 
 This class creates a ViewModel from the Response model and passes the final result to the View Clontroller to
 display as needed. This is the final step of the VIP cycle
 */
class SearchPresenter: SearchPresentationLogic {
    weak var viewController: SearchDisplayLogic?
    
    // MARK: Do something
    
    /**
     Grabs the formated response from the worker object and passes it to the View Controller as a ViewModel
     - Parameter response: The formatted service response.
     */
    func presentSearchResults(response: AnimatedGifSearch.Search.Response) {
        let viewModel = AnimatedGifSearch.Search.ViewModel(searchResult: response.searchResult)
        viewController?.displayAnimatedGifs(viewModel: viewModel)
    }
}
