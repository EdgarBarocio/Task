//
//  SearchRouter.swift
//  GifSearcher
//
//  Created on 6/4/20.
//

import UIKit

//TODO: Implement navigation, this present the gif
// Not implemented on this delivery

@objc protocol SearchRoutingLogic {
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SearchDataPassing {
  var dataStore: SearchDataStore? { get }
}

class SearchRouter: NSObject, SearchRoutingLogic, SearchDataPassing {
  weak var viewController: SearchViewController?
  var dataStore: SearchDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: SearchViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SearchDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
