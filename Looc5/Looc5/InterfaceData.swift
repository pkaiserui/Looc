//
//  InterfaceData.swift
//  Looc5
//
//  Created by PK on 3/31/15.
//  Copyright (c) 2015 PK. All rights reserved.
//

import UIKit


class InterfaceData {
    
    
    var cashedquestionRosterArray:(Array<ImageQuestionAnswer>)! = []
    
    func plist() {
        
        if let questionsPlistPath = NSBundle.mainBundle().pathForResource("Questions", ofType: "plist") {
            //println(questionsPlistPath)
            if let questionPlistPath = NSData(contentsOfFile: questionsPlistPath) {
                if let questionRosterArray = NSPropertyListSerialization.propertyListWithData(questionPlistPath, options: NSPropertyListReadOptions(), format: nil, error: nil) as? Array<Dictionary<String, AnyObject>>{
                    
                     GenerateQuestionRoster(questionRosterArray)
                }
            }
        }
    }
    func GenerateQuestionRoster (questionRosterArray: Array<Dictionary<String, AnyObject>>) {
        
        //NSDictionary *section1 = [sectionDictionary objectForKey:@"Section1"];
        
        // Overall Array Item
        var item = questionRosterArray[0] as Dictionary<String, AnyObject>
        
        // Picture Name
        var picturename = item["PictureName"] as String
        
        // Question add \(#) in place of Question - #
        var question = (item["Question - 1"] as Dictionary<String, AnyObject>)
        // String for the Question
        var Q = question["Q"] as String
        // String for 1 - 6 Answers
        var A = question["A"] as Array<String>
        // String for Answer1
        var answer1 = A[0]
        // Text for Question
        // questionText.text = "\(answer1)"
        
        
        //questionText.text = String(questionRosterArray[0]["PictureName"] )
        var  output =  ImageQuestionAnswer(picturename: picturename, Q: Q, A: A)
        self.cashedquestionRosterArray.append(output)
    }

}
