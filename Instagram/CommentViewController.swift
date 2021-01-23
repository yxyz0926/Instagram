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
    
    
    
   
    @IBAction func commentButton(_ sender: Any) {
        
        let commentRef = Firestore.firestore().collection(Const.CommentPath).document()
        
        let name = Auth.auth().currentUser?.displayName
        let commentDic = [
            "name": name!,
            "comment": self.commentTextField.text!,
            "date": FieldValue.serverTimestamp(),
            ] as [String : Any]
        commentRef.setData(commentDic)
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
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
