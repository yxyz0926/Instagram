//
//  PostDate.swift
//  Instagram
//
//  Created by Yu iwawaki on 2021/01/21.
//  Copyright © 2021 Yu.iwawaki. All rights reserved.
//

import UIKit
import Firebase

    class PostData: NSObject {
        var id: String
        var name: String?
        var caption: String?
        var date: Date?
        var likes: [String] = []
        var isLiked: Bool = false
        var comment: [String] = []
        
        
        
        init(document: QueryDocumentSnapshot) {
            self.id = document.documentID

            let postDic = document.data()

            self.name = postDic["name"] as? String

            self.caption = postDic["caption"] as? String
            
            let timestamp = postDic["date"] as? Timestamp
            self.date = timestamp?.dateValue()

            if let comment = postDic["comment"] as? [String] {
                self.comment = comment
            }
            
            if let likes = postDic["likes"] as? [String] {
                self.likes = likes
            }
            if let myid = Auth.auth().currentUser?.uid {
                // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
                if self.likes.firstIndex(of: myid) != nil {
                    // myidがあれば、いいねを押していると認識する。
                    self.isLiked = true
                }
            
        }
    }
}

