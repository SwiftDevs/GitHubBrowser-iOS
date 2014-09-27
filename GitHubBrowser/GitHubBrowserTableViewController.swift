//
//  GitHubBrowserTableViewController.swift
//  GitHubBrowser
//
//  Created by Tommy DANGerous on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class GitHubBrowserTableViewController: GitHubBrowserViewController, 
  UITableViewDataSource, UITableViewDelegate {

    override init(nibName nibNameOrNil: String!, 
        bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

  override init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    title = "Hacktoolkit"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let mainView = UIView(frame: 
      CGRect(x: 0, y: 0, 
        width: CGRectGetWidth(screenRect()), 
        height: CGRectGetHeight(screenRect())
      )
    )
    view = mainView
    let tableView = UITableView(frame:
      CGRect(x: 0, y: 0, 
        width: CGRectGetWidth(screenRect()), 
        height: CGRectGetHeight(screenRect())
      )
    )
    tableView.backgroundColor = UIColor.redColor()
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
  }

    // Protocols
    // Protocols - UITableViewDataSource
    func tableView(tableView: UITableView, 
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "ReuseIdentifier"
        let tableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1,
          reuseIdentifier: reuseIdentifier
        )
        return tableViewCell
    }
    func tableView(tableView: UITableView, 
        numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
