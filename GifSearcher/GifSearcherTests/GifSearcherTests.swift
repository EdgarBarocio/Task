//
//  GifSearcherTests.swift
//  GifSearcherTests
//
//  Created on 6/4/20.
//

import XCTest
@testable import GifSearcher

class GifSearcherTests: XCTestCase {

    func test_AnimatedGifModel_ShouldInitialize() throws {
        let gif:AnimatedGif = AnimatedGif(url: "http://media0.giphy.com/media/l4Ki5O9v4ZkNiTl7O/giphy.gif",
                                          urlSmall: "http://media.giphy.com/media/l4Ki5O9v4ZkNiTl7O/giphy-tumblr.gif")
        
        XCTAssertNotNil(gif.url, "URL should not be nil")
        XCTAssertNotNil(gif.urlSmall, "Downsized URL should not be nil")
    }
}
