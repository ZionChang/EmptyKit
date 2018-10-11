//
//  DetailCollectionViewController.swift
//  EmptyKit-Demo
//
//  Created by archerzz on 22/11/2016.
//  Copyright © 2016 archerzz. All rights reserved.
//

import UIKit
import EmptyKit

private let reuseIdentifier = "Cell"

extension UIColor {
    class func random() -> UIColor {
        let red = Double(arc4random_uniform(256)) / 255.0
        let blue = Double(arc4random_uniform(256)) / 255.0
        let green = Double(arc4random_uniform(256)) / 255.0
        return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }
}

final class DetailCollectionViewController: UICollectionViewController {
    
    var allDatasource: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.ept.delegate = self
        self.collectionView?.ept.dataSource = self
        
        let indent: CGFloat = 20.0
        
        collectionView?.contentInset = UIEdgeInsets(top: indent, left: indent, bottom: indent, right: indent)
        
        
        
    }
    
    @IBAction func add(_ sender: Any) {
        let string = String(allDatasource.count)
        allDatasource.append(string)
        collectionView?.performBatchUpdates({ 
            self.collectionView?.insertItems(at: [IndexPath(row: 0, section: 0)])
        }, completion: { (finished) in
            self.collectionView?.ept.reloadData()
        })
        
    }
    @IBAction func remove(_ sender: Any) {
        allDatasource.removeAll()
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allDatasource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        // Configure the cell
        cell.backgroundColor = UIColor.random()
        return cell
    }

}


extension DetailCollectionViewController: EmptyDataSource {
    
    func imageForEmpty(in view: UIView) -> UIImage? {
        return UIImage(named: "empty_data_bookshelf")
    }
    
    func titleForEmpty(in view: UIView) -> NSAttributedString? {
        let title = "no data"
        let font = UIFont.systemFont(ofSize: 14)
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.black, .font: font]
        
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    func buttonTitleForEmpty(forState state: UIControl.State, in view: UIView) -> NSAttributedString? {
        let title = "click me"
        let font = UIFont.systemFont(ofSize: 17)
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.white, .font: font]
        return NSAttributedString(string: title, attributes: attributes)
    }
    
    func buttonBackgroundColorForEmpty(in view: UIView) -> UIColor {
        return UIColor.blue
    }
    
    
    
}

extension DetailCollectionViewController: EmptyDelegate {
    
}
