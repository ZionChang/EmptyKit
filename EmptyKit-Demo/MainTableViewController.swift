//
//  MainTableViewController.swift
//  EmptyKit-Demo
//
//  Created by archerzz on 22/11/2016.
//  Copyright © 2016 archerzz. All rights reserved.
//

import UIKit
import EmptyKit

final class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

}

// MARK: - Global Configuration
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
