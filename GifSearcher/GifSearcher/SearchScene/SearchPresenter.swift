//
//  SearchPresenter.swift
//  GifSearcher
//
//  Created  on 6/4/20.
//

import UIKit

protocol SearchPresentationLogic {
  func presentSomething(response: Search.Something.Response)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Search.Something.Response) {
    let viewModel = Search.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
