//
//  SearchWorker.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import Foundation

/***
 Protocol to abstract search execution
 */
protocol SearchWorkerProtocol {
    func performSearch(searchTerm: String, completionHandler: @escaping ([AnimatedGif]) -> Void)
}

/**
 Worker class of the VIP Clean-Swift architecture
 
 Search worker instantiates the ServiceRequest class to perform web requests
 Returns formatted result on the main thread.
 */
class SearchWorker: SearchWorkerProtocol {
    
    var imageResults:[AnimatedGif] = []
    let serviceRequest = ServiceRequest()
    
    func performSearch(searchTerm: String, completionHandler: @escaping ([AnimatedGif]) -> Void) {
        serviceRequest.getSearchResults(searchTerm: searchTerm) { [weak self] results, errorMessage in
            
            guard let self = self else { return }
            
            if let results = results {
                self.imageResults = results
                DispatchQueue.main.async {
                    completionHandler(self.imageResults)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
            
            if !errorMessage.isEmpty {
                print("Search error: " + errorMessage)
            }
        }
    }
}
