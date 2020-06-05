//
//  GifSearchPresenterTests.swift
//  GifSearcherTests
//
//  Created on 6/5/20.
//

import XCTest
@testable import GifSearcher

class GifSearchPresenterTests: XCTestCase {

    // MARK: - Subject under test
    var sut: SearchPresenter!
    
    override func setUpWithError() throws {
        super.setUp()
        setupGifSearchPresenter()
    }

    
    // MARK: - Test Setup
    func setupGifSearchPresenter() {
        sut = SearchPresenter()
    }
    
    func test_presentGifs_shouldAskViewControllerToDisplay() throws {
        let displayLogicSpy = SearchPresenterDisplayLogicSpy()
        sut.viewController = displayLogicSpy
        
        let gif = [GifSample.sampleGif]
        
        let response = AnimatedGifSearch.Search.Response(searchResult: gif)
        sut.presentSearchResults(response: response)
        
        XCTAssertTrue(displayLogicSpy.presentGifsCalled, "Present fetched gifs should ask view controller to display them")
    }
    
    func test_PresentGifs_ShouldFormatForDisplay() {
        let displayLogicSpy = SearchPresenterDisplayLogicSpy()
        sut.viewController = displayLogicSpy
        
        let gifs = [GifSample.sampleGif]
        
        let response = AnimatedGifSearch.Search.Response(searchResult: gifs)
        sut.presentSearchResults(response: response)
        
        let displayGifs = displayLogicSpy.viewModel.searchResult!
        
        for gif:AnimatedGif in displayGifs {
            XCTAssertNotNil(gif.url, "Object should contain URL string")
            XCTAssertNotNil(gif.urlSmall, "Object should contain small URL string")
        }
    }
}
