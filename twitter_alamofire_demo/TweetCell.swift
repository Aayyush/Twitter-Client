//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    
    @IBAction func didTapFavorite(_ sender: Any) {
        print("Reached here! ")
        tweet.favorited = true
        tweet.favoriteCount! += 1
        refreshData()
        APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        
    }
    
    var tweet: Tweet! {
        didSet {
            profileImage.af_setImage(withURL: tweet.user.profileImageURL!)
            tweetTextLabel.text = tweet.text
            likeLabel.text = String(tweet.favoriteCount!)
            dateLabel.text = tweet.createdAtString
            retweetLabel.text = String(tweet.retweetCount)
            screenNameLabel.text = tweet.user.screenName
        }
    }
    
    func refreshData(){
        let indexPathToRefresh = IndexPath(row: 0, section: 0)
        NotificationCenter.default.post(name: NSNotification.Name("needToRefresh"), object: nil,userInfo: ["IndexPath": indexPathToRefresh])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
