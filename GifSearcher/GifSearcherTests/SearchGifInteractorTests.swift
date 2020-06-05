//
//  SearchGifInteractorTests.swift
//  GifSearcherTests
//
//  Created on 6/5/20.
//

import XCTest
@testable import GifSearcher

class SearchGifInteractorTests: XCTestCase {

    // MARK - Subject Under Test
    var sut: SearchInteractor!
    
    override func setUpWithError() throws {
        super.setUp()
        setupSearchInteractor()
    }

    override func tearDownWithError() throws {
    
    }

    func setupSearchInteractor() {
        sut = SearchInteractor()
    }
    
    func test_presentGifs_ShouldConfirmPresentWasCalled() {

    }
}
