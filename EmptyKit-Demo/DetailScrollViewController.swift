//
//  DetailScrollViewController.swift
//  EmptyKit-Demo
//
//  Created by zz on 2018/1/26.
//  Copyright © 2018年 archerzz. All rights reserved.
//

import UIKit
import EmptyKit

class DetailScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var shouldDisplayEmptyView = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.ept.delegate = self
        self.scrollView.ept.dataSource = self
        self.scrollView.ept.reloadData()
    }

    @IBAction func showOrHideEmptyView(_ sender: UIBarButtonItem) {
        self.shouldDisplayEmptyView = !self.shouldDisplayEmptyView
        self.scrollView.ept.reloadData()
    }
    
}

extension DetailScrollViewController: EmptyDataSource {
    
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
    
    func emptyShouldDisplay(in view: UIView) -> Bool {
        return shouldDisplayEmptyView
    }
    
}

extension DetailScrollViewController: EmptyDelegate {
    
}
