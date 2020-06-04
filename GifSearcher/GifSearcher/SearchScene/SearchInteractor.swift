//
//  SearchInteractor.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import UIKit

protocol SearchBusinessLogic {
  func doSomething(request: Search.Something.Request)
}

protocol SearchDataStore {
  //var name: String { get set }
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore {
  var presenter: SearchPresentationLogic?
  var worker: SearchWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Search.Something.Request) {
    worker = SearchWorker()
    worker?.doSomeWork()
    
    let response = Search.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
