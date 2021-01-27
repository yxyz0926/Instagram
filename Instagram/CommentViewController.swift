//
//  CommentViewController.swift
//  Instagram
//
//  Created by Yu iwawaki on 2021/01/22.
//  Copyright © 2021 Yu.iwawaki. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController{
    
    @IBOutlet weak var commentTextField: UITextField!
    
    var postArray: [PostData] = []
    var postData: PostData!
    
    
    @IBAction func commentButton(_ sender: Any) {
        
        
        let name = Auth.auth().currentUser?.displayName
        var updateValue: FieldValue
        updateValue = FieldValue.arrayUnion([
            "\(name!) : \(self.commentTextField.text!)\n",
        ])
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comment": updateValue])
        
        
        
        
        
        SVProgressHUD.showSuccess(withStatus: "投稿完了")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func commentCancelButton(_ sender: Any) {
   
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
        
    }


    

    
}
