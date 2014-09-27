//
//  OrganizationDetails.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class OrganizationDetailsViewController: GitHubBrowserTableViewController {
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

    var hacktoolkitOrg = GitHubOrganization(name: "hacktoolkit", onInflated: {
        (org: GitHubResource) -> () in
        if let org = org as? GitHubOrganization {
            println(org.location)
            println(org.name)
        }
    })
  }

  // Methods
  class RepositoryStruct {
    var name: String
    init(name: String) {
      self.name = name
    }
  }
  func objects() -> [RepositoryStruct] {
    var array = [RepositoryStruct]()
    for i in 1...10 {
      let repo = RepositoryStruct(name: "Repository \(i)")
      array.append(repo)
    }
    return array
  }
  func objectAtIndexPath(indexPath: NSIndexPath) -> RepositoryStruct {
    return objects()[indexPath.row]
  }

    // Protocols
    // Protocols - UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, 
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseIdentifier = "ReuseIdentifier"
        let tableViewCell = UITableViewCell(style: UITableViewCellStyle.Value1,
          reuseIdentifier: reuseIdentifier
        )
        tableViewCell.contentView.backgroundColor = UIColor.greenColor()
        tableViewCell.textLabel?.text = objectAtIndexPath(indexPath).name
        return tableViewCell
    }
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return objects().count
    }

    // Protocols - UITableViewDelegate
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let repository = objectAtIndexPath(indexPath)
        let vc = RepositoryDetailsViewController(
            repository: repository
        )
        println(repository.name)
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
