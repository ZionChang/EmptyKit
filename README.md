EmptyKit
=======
> A lightweight, swift library for displaying emptyView whenever the view(tableView/collectionView) has no content to display, just like [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)

[![Swift Version][swift-image]][swift-url]
[![Pod Version](http://img.shields.io/cocoapods/v/EmptyKit.svg)](http://cocoadocs.org/docsets/EmptyKit/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

* [中文](#user-content-中文介绍)

<span id = "English">


## Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift4 (EmptyKit 4.x) Swift3(EmptyKit 3.x)

## Installation

### Carthage
Create a `Cartfile` that lists the framework. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/EmptyKit.framework` to an iOS project.

```ruby
github "ZionChang/EmptyKit"
```

Run `carthage update` to build the framework and drag the built `EmptyKit.framework` into your Xcode project.

To get the full benefits import `EmptyKit`

``` swift
import EmptyKit
```

### CocoaPods

You can use [CocoaPods](http://cocoapods.org/) to install `EmptyKit` by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'EmptyKit'
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
        let attributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.black, .font: font]
        return NSAttributedString(string: title, attributes: attributes)
    }

    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString? {
        let title = "click me"
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.white, .font: font]
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

1. **Conform EmptyDataSource or EmptyDelegate**

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
```

2. **Remember use your custom protocol**

```swift
extension ProjectNameViewController: ProjectNameEmptyDataSource {}
extension ProjectNameViewController: ProjectNameEmptyDelegate {}

```

</span>

<span id = "Chinese">
# 中文介绍

## 要求

* iOS8.0+
* Xcode 8.0+

## 安装
### Cathage
首先需要安装[Carthage](https://github.com/Carthage/Carthage#if-youre-building-for-ios)

创建一个`Cartfile`，在其中列出需要的framework
```ruby
github "ZionChang/EmptyKit"	
```

命令行运行`carthage update`来构建framework，并且将`EmptyKit.framework`拖拽到Xcode中。

```swift
import EmptyKit
```
### CocoaPods

创建`Podfile`

```ruby
platform :ios, '8.0'
use_frameworks!
pod 'EmptyKit', '~> 3.0.2'
```

然后运行

```ruby
pod install
```
### 手动
1. 下载并且将EmptyKit文件夹拖拽至你的工程
2. 恭喜！

## 用法

### 遵守协议

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

### 数据源实现

```swift
extension DetailTableViewController: EmptyDataSource {

    func imageForEmpty(in view: UIView) -> UIImage? {
        return UIImage(named: "empty_data_bookshelf")
    }

    func titleForEmpty(in view: UIView) -> NSAttributedString? {
        let title = "no data"
        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.black, .font: font]
        return NSAttributedString(string: title, attributes: attributes)
    }

    func buttonTitleForEmpty(forState state: UIControlState, in view: UIView) -> NSAttributedString? {
        let title = "click me"
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [NSAttributedStringKey : Any] = [.foregroundColor: UIColor.white, .font: font]
        return NSAttributedString(string: title, attributes: attributes)
    }

    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.blue
    }

}
```
或者你能实现`EmptyDataSource`中的其他方法

### 代理实现

```swift
extension DetailTableViewController: EmptyDelegate {

    func emptyButton(_ button: UIButton, tappedIn view: UIView) {
        print( #function, #line, type(of: self))
    }

    func emptyView(_ emptyView: UIView, tappedIn view: UIView) {
        print( #function, #line, type(of: self))
    }
}
```

### 刷新布局

```swift
self.tableView.reloadData()
```
或者

```swift
self.collectionView.reloadData()
```


### 强制刷新空视图

```swift
self.tableView.ept.reloadData()
```
或者

```swift
self.collectionView.ept.reloadData()
```

### 全局配置

* **遵守EmptyDataSource或者EmptyDelegate**

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
```

* **一旦全局配置，就使用你配置的协议名字**

```swift
extension ProjectNameViewController: ProjectNameEmptyDataSource {}
extension ProjectNameViewController: ProjectNameEmptyDelegate {}

```

</span>

[swift-image]:https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/

### License

EmptyKit is licensed under the MIT License, please see the LICENSE file.



