//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String?
    var profileImageURL: URL?
    var screenName: String?
    static var current: User?
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? "Unknown"
        screenName = dictionary["screenName"] as? String ?? "Unknown User"
        let profileImageURLPath = dictionary["profile_image_url_https"] as! String
        profileImageURL = URL(string:profileImageURLPath)
    }
}