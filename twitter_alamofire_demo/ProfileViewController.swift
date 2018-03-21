//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aayush  Gupta on 3/20/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userInfo: [String: Any]?

    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var tweetCount: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.getUserInformation(username: "84aayush84") { (userInfo, error) in
            if let userInfo = userInfo {
                self.followersCount.text = String(describing: userInfo.dictionary!["followers_count"]!)
                self.followingCount.text = String(describing: userInfo.dictionary!["friends_count"]!)
                self.tweetCount.text = String(describing: userInfo.dictionary!["statuses_count"]!)
                self.screenNameLabel.text = String(describing: userInfo.dictionary!["screen_name"]!)
                self.usernameLabel.text = String(describing: userInfo.dictionary!["name"]!)
                self.profileImage.af_setImage(withURL: userInfo.profileImageURL!)
            } else if let error = error {
                print("Error getting home timeline: " + error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
