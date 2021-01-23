//
//  CommentViewController.swift
//  Instagram
//
//  Created by Yu iwawaki on 2021/01/22.
//  Copyright © 2021 Yu.iwawaki. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController{

    
    @IBOutlet weak var commentTextField: UITextField!
    
    
    
   
    @IBAction func commentButton(_ sender: Any) {
        
        
        
        
        
        
        
        
        
        
        
         UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
        
    }
    

    

    
}
