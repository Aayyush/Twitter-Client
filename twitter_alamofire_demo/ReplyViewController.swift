//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aayush  Gupta on 3/20/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

class ReplyViewController: UIViewController {

    var tweet_id: String!
    
    @IBOutlet weak var replyText: RSKPlaceholderTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replyText.placeholder = "Reply Text"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapReply(_ sender: Any) {
        APIManager.shared.replyTweet(with: replyText.text, status_id: tweet_id) { (tweetPosted, error) in
            if let error = error {
                print("Error replying to Tweet: \(error.localizedDescription)")
            } else if tweetPosted != nil {
                print("Reply to Tweet Success!")
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name("returnHome"), object: nil)
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
