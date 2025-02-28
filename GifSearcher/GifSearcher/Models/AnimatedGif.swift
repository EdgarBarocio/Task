//
//  AnimatedGif.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import Foundation

/**
 Data model to represent the Animated Gif search results form the Giphy API
 */
struct AnimatedGif: Codable {
    let url: String
    let urlSmall: String
    
    init(url:String, urlSmall:String) {
        self.url = url
        self.urlSmall = urlSmall
    }
}
