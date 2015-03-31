//
//  ImageViewController.swift
//  Looc5
//
//  Created by PK on 3/24/15.
//  Copyright (c) 2015 PK. All rights reserved.
//

import UIKit



class ImageViewController : UIViewController {
    
    @IBOutlet weak var time: UILabel!
    
    var timer = NSTimer()
    
    var count = 2
    
    func result() {
        
        count = count - 1
        
        time.text = "\(count)"
        
        if count <= 0 {
            
            var questionVC = storyboard?.instantiateViewControllerWithIdentifier("QuestionViewController")
                as QuestionViewController
            presentViewController(questionVC, animated: true, completion: nil)
            
            timer.invalidate()
            
            
            
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    
    
    
}
