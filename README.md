EmptyKit
=======
> A lightweight, swift library for displaying emptyView whenever the view(tableView/collectionView) has no content to display, just like [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)

[![Swift Version][swift-image]][swift-url]
[![Pod Version](http://img.shields.io/cocoapods/v/EmptyKit.svg)](http://cocoadocs.org/docsets/EmptyKit/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

## Requirements

- iOS 8.0+
- Xcode 8.0+

## Installation

###Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/EmptyKit.framework` to an iOS project.

```
github "eilianlove/EmptyKit"
```

Run `carthage update` to build the framework and drag the built `EmptyKit.framework` into your Xcode project.

To get the full benefits import `EmptyKit`

``` swift
import EmptyKit
```

###CocoaPods

You can use [CocoaPods](http://cocoapods.org/) to install `EmptyKit` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'EmptyKit', '~> 3.0.2'
```

Then, run the following command:

```ruby
$ pod install
```

### Manually
1. Download and drop ```Empty``` in your project.  
2. Congratulations!  

## Usage

### Protocol Conformance

```swift
final class DetailTableViewController: UITableViewController { 

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.ept.dataSource = self
        tableView.ept.delegate = self
    }

}

```

### Data Source Imp

```swift
extension DetailTableViewController: EmptyDataSource {

    func imageForEmpty(in view: UIView) -> UIImage? {
        return UIImage(named: "empty_data_bookshelf")
    }

    func titleForEmpty(in view: UIView) -> NSAttributedString? {
        let title = "no data"
        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [String : Any] = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: font]
        return NSAttributedString(string: title, attributes: attributes)
    }

    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString? {
        let title = "click me"
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [String : Any] = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: font]
        return NSAttributedString(string: title, attributes: attributes)
    }

    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.blue
    }

}
```
Or you can implement other methods of EmptyDataSource

### Delegate Imp

```swift
extension DetailTableViewController: EmptyDelegate {

    func emptyButton(_ button: UIButton, didTappedIn view: UIView) {
        print( #function, #line, type(of: self))
    }

    func emptyView(_ emptyView: UIView, didTapppedIn view: UIView) {
        print( #function, #line, type(of: self))
    }
}

```

### Refresh layout

```swift
self.tableView.reloadData()
```
or

```swift
self.collectionView.reloadData()
```
depending of which you are using.

### Force layout update

```swift
self.tableView.ept.reloadData()
```
or

```swift
self.collectionView.ept.reloadData()
```

### Global Configuration

```swift
protocol ProjectNameEmptyDataSource: EmptyDataSource {}
extension ProjectNameEmptyDataSource {
    // implement any method you want
    func backgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.white
    }
    // other methods
}

protocol ProjectNameEmptyDelegate: EmptyDelegate {}
extension ProjectNameEmptyDelegate {
    // just like the ProjectNameEmptyDataSource
}

final class ProjectNameViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.ept.dataSource = self
        tableView.ept.delegate = self
    }
}

extension ProjectNameViewController: ProjectNameEmptyDataSource {}
extension ProjectNameViewController: ProjectNameEmptyDelegate {}

```



[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/



