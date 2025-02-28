//
//  SearchViewController.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import UIKit

/**
 Enum to display error messages on text field
 */
private enum SearchDisplayResults: String {
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
 
 View that starts the VIP cycle. Containing a search bar, button to perform search and a
 collection view to display results. 
 */
class SearchViewController: UIViewController, SearchDisplayLogic {
    var interactor: SearchBusinessLogic?
    var router: (NSObjectProtocol & SearchRoutingLogic & SearchDataPassing)?
    var results: [AnimatedGif] = []
    
    // MARK: Outlets
    @IBOutlet weak var searchTextField: UITextField!
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
        
        searchResults?.delegate = self
        searchResults?.dataSource = self
        searchResults?.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellWithReuseIdentifier: "GifCell")
        searchButton?.isEnabled = false
        searchTextField?.delegate = self
        searchGifs()
    }
    
    // MARK: Actions
    
    func searchGifs() {
        let text = searchTextField?.text ?? ""
        let request = AnimatedGifSearch.Search.Request(searchTerm: text)
        interactor?.performGifSearch(request: request)
    }
    
    
    func displayAnimatedGifs(viewModel: AnimatedGifSearch.Search.ViewModel) {
        
        guard let result = viewModel.searchResult else {
            searchTextField?.text = SearchDisplayResults.noResults.rawValue
            return
        }
        
        results = result
        searchResults?.reloadData()
    }
    
    // MARK: Button Action
    @IBAction func searchPressed(_ sender: Any) {
        searchTextField?.resignFirstResponder()
        searchGifs()
    }
}

// MARK: Text field Delegate and Protocols
extension SearchViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchButton?.isEnabled = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchGifs()
        
        return true
    }
}

// MARK: CollectionView Datasource and Delegate
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "GifCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SearchResultCell
        
        let displayInfo = results[indexPath.row]
        cell.update(with: displayInfo.urlSmall)
        return cell
    }
}
