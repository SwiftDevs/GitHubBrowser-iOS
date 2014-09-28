//
//  RepositoryDetailsViewController.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: GitHubBrowserTableViewController,
    UITabBarDelegate {
    var descriptionLabel: UILabel?
    var detailsView: UIView?
    var repository: GitHubRepository
    var webView: UIWebView?
    var tabBar: UITabBar?

    init(repository repo: GitHubRepository) {
        repository = repo
        super.init(nibName: nil, bundle: nil)
        title = repository.name
        println(repository.name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let screen = screenRect()
        descriptionLabel = UILabel()
        descriptionLabel!.backgroundColor = UIColor.blackColor()

        detailsView = UIView(frame: screen)
        detailsView!.backgroundColor = UIColor.whiteColor()
        // detailsView!.addSubview(descriptionLabel!)

        webView = UIWebView(frame:
            CGRect(
                x: 0,
                y: 20 + 44,
                width: CGRectGetWidth(screen),
                height: CGRectGetHeight(screen) - (20 + 44 + 48)
            )
        )
        self.detailsView!.addSubview(webView!)

        let tab1 = UITabBarItem(title: "Readme", image: nil, tag: 0)
        let tab2 = UITabBarItem(title: "Files", image: nil, tag: 1)
        tabBar = UITabBar(frame:
            CGRect(
                x: 0,
                y: CGRectGetHeight(screen) - 48,
                width: CGRectGetWidth(screen),
                height: 48
            )
        )
        tabBar!.items = [tab1, tab2]
        tabBar!.selectedItem = tab1
        tabBar!.delegate = self

        self.view.addSubview(detailsView!)
        self.mainTableView.hidden = true

        self.view.addSubview(tabBar!)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.descriptionLabel!.text = repository.description;
        let rect = self.descriptionLabel!.textRectForBounds(
            screenRect(),
            limitedToNumberOfLines: 0
        )
        self.descriptionLabel!.frame = rect
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let string  = repository.getReadmeUrl()
        println(repository.getReadmeUrl())
        let url     = NSURL(string: string)
        let request = NSURLRequest(URL: url)
        webView!.loadRequest(request)
    }

    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        if item.tag == 0 {
            self.detailsView!.hidden  = false
            self.mainTableView.hidden = true
        } else if item.tag == 1 {
            self.detailsView!.hidden  = true
            self.mainTableView.hidden = false
        }
    }
}
