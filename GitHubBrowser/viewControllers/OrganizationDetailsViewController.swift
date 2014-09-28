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
    var activityIndicatorView: UIActivityIndicatorView!

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
        tableHeaderView.backgroundColor = UIColor(
            white: 0, alpha: 0.1
        )
        self.mainTableView.tableHeaderView = tableHeaderView

        let imageViewWidth = CGRectGetHeight(tableHeaderView.frame) - 20
        organizationImageView = UIImageView(frame:
            CGRect(x: 10, y: 10, width: imageViewWidth, height: imageViewWidth)
        )
        organizationImageView.backgroundColor = UIColor(
            white: 0, alpha: 0.7
        )
        activityIndicatorView = UIActivityIndicatorView(
            activityIndicatorStyle: UIActivityIndicatorViewStyle.White
        )
        organizationImageView.addSubview(
            activityIndicatorView
        )
        activityIndicatorView.frame = CGRect(
            x: (CGRectGetWidth(organizationImageView.frame) - 
                CGRectGetWidth(activityIndicatorView.frame)) * 0.5,
            y: (CGRectGetHeight(organizationImageView.frame) -
                CGRectGetHeight(activityIndicatorView.frame)) * 0.5,
            width: CGRectGetWidth(activityIndicatorView.frame),
            height: CGRectGetHeight(activityIndicatorView.frame)
        )
        activityIndicatorView.startAnimating()
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
        nameLabel.font = UIFont.boldSystemFontOfSize(22)
        tableHeaderView.addSubview(nameLabel)

        locationLabel = UILabel(frame:
            CGRect(
                x: CGRectGetMinX(nameLabel.frame),
                y: CGRectGetMaxY(nameLabel.frame),
                width: CGRectGetWidth(nameLabel.frame),
                height: CGRectGetHeight(nameLabel.frame)
            )
        )
        locationLabel.font = UIFont.systemFontOfSize(15)
        locationLabel.textColor = UIColor(white: 0, alpha: 0.5)
        tableHeaderView.addSubview(locationLabel)
    }

    override func viewWillAppear(animated: Bool) {
        var org = GitHubOrganization(name: organizationName, onInflated: {
            (org: GitHubResource) -> () in

            if let org = org as? GitHubOrganization {
                self.organization          = org
                self.organization.name     = self.organizationName
                self.organization.location = "San Francisco, CA"
                self.locationLabel.text = self.organization.location
                self.nameLabel.text     = self.organization.name

                dispatch_async(dispatch_get_main_queue(), {
                    self.organization.avatarUrl = "https://avatars0.githubusercontent.com/u/5404851?v=2&s=200"
                    if self.organization.avatarUrl != nil {
                        var test =  UIImage(data: NSData(contentsOfURL: 
                                NSURL(string: self.organization.avatarUrl)
                            )
                        )
                        self.organizationImageView.image = test
                        self.activityIndicatorView.stopAnimating()
                    }
                });
            }
        })
        // org.getRepositories {
        //     (repositories: [GitHubRepository]) -> () in

        //     // self.mainTableView.reloadData()
        // }
    }

    // Methods
    func objects() -> [GitHubRepository] {
        // if self.organization.repositories != nil {
        //     return self.organization.repositories
        // }
        return [GitHubRepository]()
    }
    func objectAtIndexPath(indexPath: NSIndexPath) -> GitHubRepository {
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
        let repository = objectAtIndexPath(indexPath)
        tableViewCell.textLabel?.text = repository.name
        tableViewCell.textLabel?.font = UIFont.systemFontOfSize(18)
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
