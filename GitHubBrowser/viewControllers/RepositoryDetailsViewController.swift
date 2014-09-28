//
//  RepositoryDetailsViewController.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: GitHubBrowserTableViewController {
 var repository: GitHubRepository

  init(repository repo: GitHubRepository) {
    repository = repo
    super.init(nibName: nil, bundle: nil)
    title = repository.name
    println(repository.name)
  }
}
