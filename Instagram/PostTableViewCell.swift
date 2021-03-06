//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Yu iwawaki on 2021/01/21.
//  Copyright © 2021 Yu.iwawaki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
   
     // PostDataの内容をセルに表示
        func setPostData(_ postData: PostData) {
            // 画像の表示
            postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
            postImageView.sd_setImage(with: imageRef)

            // キャプションの表示
            self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
            
            
            //コメントの表示
            var allComments = ""
            for comments in postData.comment{
                
                allComments += comments
                
                self.commentLabel.text = allComments
                
            }
            
            
            // 日時の表示
            self.dateLabel.text = ""
            if let date = postData.date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm"
                let dateString = formatter.string(from: date)
                self.dateLabel.text = dateString
            }

            // いいね数の表示
            let likeNumber = postData.likes.count
            likeLabel.text = "\(likeNumber)"

            // いいねボタンの表示
            if postData.isLiked {
                let buttonImage = UIImage(named: "heart_exist")
                self.likeButton.setImage(buttonImage, for: .normal)
            } else {
                let buttonImage = UIImage(named: "heart_none")
                self.likeButton.setImage(buttonImage, for: .normal)
            }
    }
    
}
