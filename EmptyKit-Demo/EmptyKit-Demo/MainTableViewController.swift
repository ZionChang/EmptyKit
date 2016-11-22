//
//  MainTableViewController.swift
//  EmptyKit-Demo
//
//  Created by archerzz on 22/11/2016.
//  Copyright © 2016 archerzz. All rights reserved.
//

import UIKit

final class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

}
