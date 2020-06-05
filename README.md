# Gif Searcher

**About**
This is a simple Animated Gif searcher as a single view. Built using VIP [Clean-Swift](https://clean-swift.com) Architecture.

Currently app only takes a search term from the text field, perfoms search and displays results on a Collection View, results are limited to 25 per API provided and no interaction is available on the cells yet. Those will be implemented in a new version.

**Requirements**
* Xcode 11.5
* Cocoapods

**Setup**
* Clone the repo locally
* Run `pod install` on the terminal
* Open `GifSearcher.xcworkspace` and run

**Architectue**
Application is built using VIP Clean-Swift, this is to improve testability and to allow for each class to be dedicated to only one task

* View: View controller of the app, hosts the initial view and shows results returned by the Presenter
* Interactor: Takes actions done on the View and instantiates the Worker to perfomr tasks such as making the service call, parsing response and if applicable, DB queries or other tasks
* Presenter: Takes the information from the Interactor and sends it to the View for display
* Worker: Heavy lifting class, in this project, makes the service call and parses the result
* Router: Navigation to other scenes and views. Not implemented in the first step but will be implemented soon. This handles al segues and transitions and helps with data transfer between flows.

**Third Party Frameworks**
Application uses [FLAnimatedImage](https://github.com/Flipboard/FLAnimatedImage) to display animated gifs on the results

**Future improvements**
* Convert Service Response parser and Animated Gif model to use Codable, instead of dictionaries and tight key values
* Add more unit tests
* Layout on the collection view
* Loading indicator on images and responses
* Navigation, when tapping on a GIF, app will show a full screen view with the GIF.

