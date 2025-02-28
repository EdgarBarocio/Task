//
//  SearchModels.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import UIKit

/**
 Enum containing the Use Cases for the VIP Clean-Swift implementation
 
 - Request: The search term used for the gif search
 - Response:The response from the service, an array of Gifs formatted with the info relevant to the app
 - ViewModel: Same as the response, but handled as a view model to pass with the protocols
 */
enum AnimatedGifSearch {
    // MARK: Use cases
    
    enum Search {
        struct Request {
            var searchTerm: String
        }
        
        struct Response {
            var searchResult: [AnimatedGif]?
        }
        
        struct ViewModel {
            var searchResult: [AnimatedGif]?
        }
    }
    
}
