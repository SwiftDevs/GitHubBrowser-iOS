//
//  OrganizationDetails.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class OrganizationDetailsViewController: GitHubBrowserViewController, 
  UITableViewDataSource, UITableViewDelegate {

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

  // Methods
  struct Repo {
    var name: String
    init(name: String) {
      self.name = name
    }
  }
  func objects() -> [Repo] {
    var array = [Repo]()
    for i in 1...10 {
      let repo = Repo(name: "Repository \(i)")
      array.append(repo)
    }
    return array
  }

  // Protocols
  // Protocols - UITableViewDataSource

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  func tableView(tableView: UITableView, 
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let reuseIdentifier = "ReuseIdentifier"
    let tableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1,
      reuseIdentifier: reuseIdentifier
    )
    tableViewCell.contentView.backgroundColor = UIColor.greenColor()
    let repo = objects()[indexPath.row]
    tableViewCell.textLabel?.text = repo.name
    return tableViewCell
  }
  func tableView(tableView: UITableView, 
    numberOfRowsInSection section: Int) -> Int {
    return objects().count
  }
}
