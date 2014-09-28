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
        descriptionLabel!.backgroundColor = UIColor.redColor()

        detailsView = UIView(frame: screen)
        detailsView!.backgroundColor = UIColor.whiteColor()
        detailsView!.addSubview(descriptionLabel!)
        
        self.view.addSubview(detailsView!)
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
}
