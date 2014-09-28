//
//  RepositoryDetailsViewController.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: GitHubBrowserTableViewController {
    var descriptionLabel: UILabel?
    var detailsView: UIView?
    var repository: GitHubRepository
    var webView: UIWebView?

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
        detailsView!.addSubview(descriptionLabel!)

        webView = UIWebView(frame:
            CGRect(
                x: 0,
                y: 20 + 44,
                width: CGRectGetWidth(screen),
                height: CGRectGetHeight(screen) - (20 + 44)
            )
        )

        // self.view.addSubview(detailsView!)
        self.view.addSubview(webView!)
        self.mainTableView.hidden = true
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
}
