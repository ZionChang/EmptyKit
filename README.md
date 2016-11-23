EmptyKit
=======
[![Pod Version](http://img.shields.io/cocoapods/v/EmptyKit.svg)](http://cocoadocs.org/docsets/EmptyKit/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)

A lightweight, swift library for displaying emptyView whenever the view(tableView/collectionView) has no content to display, just like [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)
## Usage

### import

```swift
import EmptyKit

```

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






















