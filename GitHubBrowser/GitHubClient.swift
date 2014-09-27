//
//  GitHubClient.swift
//  GitHubBrowser
//
//  Created by Jonathan Tsai on 9/27/14.
//  Copyright (c) 2014 Hacktoolkit. All rights reserved.
//

import Foundation

let GITHUB_API_BASE_URL = "https://api.github.com"

class GitHubClient {

    class var sharedInstance : GitHubClient {
        struct Static {
            static var token : dispatch_once_t = 0
            static var instance : GitHubClient? = nil
        }
        dispatch_once(&Static.token) {
            Static.instance = GitHubClient()
        }
        return Static.instance!
    }

    func makeApiRequest(resource: String, callback: (NSDictionary) -> ()) {
        var apiUrl = "\(GITHUB_API_BASE_URL)\(resource)"
        let request = NSMutableURLRequest(URL: NSURL.URLWithString(apiUrl))

        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) in
            var errorValue: NSError? = nil
            let resultJSON: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &errorValue)
            if let resultJSON = resultJSON as? NSDictionary {
                callback(resultJSON)
            } else {
                HTKNotificationUtils.displayNetworkErrorMessage()
            }
        })
    }
}
