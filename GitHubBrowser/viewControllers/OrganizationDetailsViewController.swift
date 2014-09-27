//
//  OrganizationDetails.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class OrganizationDetailsViewController: GitHubBrowserTableViewController {
    let organizationName = "hacktoolkit"

    var locationLabel: UILabel!
    var nameLabel: UILabel!
    var organization: GitHubOrganization!
    var organizationImageView: UIImageView!

    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = organizationName
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let screen = screenRect()
        let tableHeaderView = UIView(frame: 
            CGRect(x: 0, y: 0, width: CGRectGetWidth(screen), height: 100)
        )
        tableHeaderView.backgroundColor = UIColor.redColor()
        self.mainTableView.tableHeaderView = tableHeaderView

        let imageViewWidth = CGRectGetHeight(tableHeaderView.frame) - 20
        organizationImageView = UIImageView(frame:
            CGRect(x: 10, y: 10, width: imageViewWidth, height: imageViewWidth)
        )
        organizationImageView.backgroundColor = UIColor.yellowColor()
        tableHeaderView.addSubview(organizationImageView)

        nameLabel = UILabel(frame:
            CGRect(
                x: CGRectGetMinX(organizationImageView.frame) +
                    CGRectGetWidth(organizationImageView.frame) + 10,
                y: CGRectGetMinY(organizationImageView.frame),
                width: CGRectGetWidth(screen),
                height: imageViewWidth * 0.5
            )
        )
        tableHeaderView.addSubview(nameLabel)

        locationLabel = UILabel(frame:
            CGRect(
                x: CGRectGetMinX(nameLabel.frame),
                y: CGRectGetMaxY(nameLabel.frame),
                width: CGRectGetWidth(nameLabel.frame),
                height: CGRectGetHeight(nameLabel.frame)
            )
        )
        tableHeaderView.addSubview(locationLabel)
    }

    override func viewWillAppear(animated: Bool) {
        var hacktoolkitOrg = GitHubOrganization(name: organizationName, 
            onInflated: {
            (org: GitHubResource) -> () in
            if let org = org as? GitHubOrganization {
                self.organization = org
                self.locationLabel.text = org.location
                self.nameLabel.text = org.name
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
