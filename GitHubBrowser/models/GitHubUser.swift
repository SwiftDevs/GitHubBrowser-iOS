//
//  GitHubUser.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import Foundation

class GitHubUser: GitHubResource {

    // User attributes
    var login: String!
    var id: Int!
    //    "login": "octocat",
    //    "id": 1,
    //    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
    //    "gravatar_id": "somehexcode",
    //    "url": "https://api.github.com/users/octocat",
    //    "html_url": "https://github.com/octocat",
    //    "followers_url": "https://api.github.com/users/octocat/followers",
    //    "following_url": "https://api.github.com/users/octocat/following{/other_user}",
    //    "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
    //    "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
    //    "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
    //    "organizations_url": "https://api.github.com/users/octocat/orgs",
    //    "name": "monalisa octocat",
    //    "company": "GitHub",
    //    "blog": "https://github.com/blog",
    //    "location": "San Francisco",
    //    "email": "octocat@github.com",
    //    "hireable": false,
    //    "bio": "There once was...",
    //    "public_repos": 2,
    //    "public_gists": 1,
    //    "followers": 20,
    //    "following": 0,

    init() {
        
    }

    init(userDict: NSDictionary) {
        self.login = userDict["login"] as? String
    }
}

//{
//    "login": "octocat",
//    "id": 1,
//    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//    "gravatar_id": "somehexcode",
//    "url": "https://api.github.com/users/octocat",
//    "html_url": "https://github.com/octocat",
//    "followers_url": "https://api.github.com/users/octocat/followers",
//    "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//    "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//    "organizations_url": "https://api.github.com/users/octocat/orgs",
//    "repos_url": "https://api.github.com/users/octocat/repos",
//    "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/octocat/received_events",
//    "type": "User",
//    "site_admin": false,
//    "name": "monalisa octocat",
//    "company": "GitHub",
//    "blog": "https://github.com/blog",
//    "location": "San Francisco",
//    "email": "octocat@github.com",
//    "hireable": false,
//    "bio": "There once was...",
//    "public_repos": 2,
//    "public_gists": 1,
//    "followers": 20,
//    "following": 0,
//    "created_at": "2008-01-14T04:33:35Z",
//    "updated_at": "2008-01-14T04:33:35Z"
//}
