//
//  SearchViewController.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import UIKit

/**
 Enum to display error messages and search status
 */
private enum SearchDisplayResults: String {
    case firstMessage = "Enter Search Term"
    case loadingMessage = "Searching..."
    case noResults = "No Results Found"
}

/**
 Protocol to display result of all searches
 */
protocol SearchDisplayLogic: class {
    func displayAnimatedGifs(viewModel: AnimatedGifSearch.Search.ViewModel)
}

/**
 View controller clas of the VIP Clean-Swift Architecture
 
 View of the
 */
class SearchViewController: UIViewController, SearchDisplayLogic {
    var interactor: SearchBusinessLogic?
    var router: (NSObjectProtocol & SearchRoutingLogic & SearchDataPassing)?
    
    // MARK: Outlets
    @IBOutlet weak var searTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchResults: UICollectionView!
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    //TODO: Implement push segue to display full screen gif. not implemented on this delivery
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let scene = segue.identifier {
//            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//            if let router = router, router.responds(to: selector) {
//                router.perform(selector, with: segue)
//            }
//        }
//    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = AnimatedGifSearch.Search.Request(searchTerm: "Cat")
        interactor?.performGifSearch(request: request)
    }
    
    func displayAnimatedGifs(viewModel: AnimatedGifSearch.Search.ViewModel) {
        //nameTextField.text = viewModel.name
        print(viewModel.searchResult)
    }
}
