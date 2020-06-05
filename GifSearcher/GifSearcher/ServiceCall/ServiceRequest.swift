//
//  ServiceRequest.swift
//  GifSearcher
//
//  Created by Edgar Barocio on 6/4/20.
//  Copyright © 2020 Edgar Barocio. All rights reserved.
//

import Foundation

/**
    Class for Service call request and response parsing.
    Uses URLSession instead of a third party framework becase we only want a request and response.
 */
class ServiceRequest {
    
    typealias JSONDictionary = [String: Any]
    typealias SearchResult = ([AnimatedGif]?, String) -> ()
    
    var urlSession = URLSession(configuration: .default)
    var urlDataTask: URLSessionDataTask?
    var images: [AnimatedGif] = []
    var errorMessage = ""
    
    
    func getSearchResults(searchTerm: String, completion: @escaping SearchResult) {
        urlDataTask?.cancel()
        
        //Giphy API. Limited to 25 results, used as provided.
        let originalString = "https://api.giphy.com/v1/gifs/search?api_key=229ac3e932794695b695e71a9076f4e5&limit=25&offset=0&rating=G&lang=en&q=\(searchTerm)"
        let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlString!) else { return }
        
        urlDataTask = urlSession.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            defer { self.urlDataTask = nil }
            
            if let error = error {
                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                self.parseResults(data)
                
                DispatchQueue.main.async {
                    completion(self.images, self.errorMessage)
                }
            }
        }
        
        urlDataTask?.resume()
    }
    
    fileprivate func parseResults(_ data: Data) {
        var response: JSONDictionary?
        images.removeAll()
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        guard let array = response!["data"] as? [Any] else {
            errorMessage += "Dictionary does not contain Data key, no results returned in success \n"
            return
        }
        print(array[0])
//        let decoder = JSONDecoder()
//
//        do {
//            let decoded = try decoder.decode([AnimatedGif].self, from: data)
//            print(decoded[0].url)
//        } catch {
//            print("Failed to decode JSON")
//        }
    }
    
}
