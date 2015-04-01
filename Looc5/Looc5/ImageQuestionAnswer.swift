//
//  ImageQuestionAnswer.swift
//  Looc5
//
//  Created by PK on 3/31/15.
//  Copyright (c) 2015 PK. All rights reserved.
//

import UIKit



class ImageQuestionAnswer  {
    
    
    init (picturename:(String), Q:(String),A:(Array<String>)) {
        self.picturename = picturename
        self.Q = Q
        self.A = A
        
    }
    // Overall Array Item
    //var item = questionRosterArray[0] as Dictionary<String, AnyObject>
    
    
    
    // Picture Name
    var picturename: String
    
    // Question add \(#) in place of Question - #
    // var question = (item[] as Dictionary<String, AnyObject>)
    // String for the Question
    var Q: String
    // String for 1 - 6 Answers
    var A : Array<String>
    
    
    
    // Text for Question
    //questionText.text = "\(Q)"

    

}
    

