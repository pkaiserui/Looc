//
//  QuestionsViewController.swift
//  Looc5
//
//  Created by PK on 3/24/15.
//  Copyright (c) 2015 PK. All rights reserved.
//

import UIKit

// This is my edit


class QuestionViewController : UIViewController {
    
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var answerOneText: UIButton!
    
    @IBOutlet weak var answerTwoText: UIButton!
    
    @IBOutlet weak var answerThreeText: UIButton!
    
    @IBOutlet weak var answerFourText: UIButton!
    
    @IBOutlet weak var answerFiveText: UIButton!
    
    
    var questionRosterArray:(Array<Dictionary<String, AnyObject>>)! = []
    
    
    /* Random Question Select
    var myArray = [1,2,3,4,5,6]
    
    var countArray = UInt32(myArray.count)
    
    let diceRoll = (arc4random_uniform(countArray)+1)
    */
    
    
    
    
    @IBAction func answerOneButton(sender: UIButton) {
        answerOneText.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
         //var question1 = ImageQuestionAnswer(Q: Q)
        
         //questionText.text = "\(question1)"
        
        
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
        questionText.text = "\(answer1)"
        
        
        //questionText.text = String(questionRosterArray[0]["Q"] )
        
      
    }
    
    
    @IBAction func answerTwoButton(sender: UIButton) {
        answerTwoText.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
    }
    
    
    @IBAction func answerThreeButton(sender: UIButton) {
        answerThreeText.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        var bonustime = time.text!.toInt()
        var result = 1000 + (10 * Int(bonustime!))
        score.text = "\(result)"
        timer.invalidate()
        
        
    }
    
    @IBAction func answerFourButton(sender: UIButton) {
        answerFourText.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
        
        
    }
    
    @IBAction func answerFiveButton(sender: UIButton) {
        answerFiveText.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
        
        
    }
    
    
    
    
    
    var timer = NSTimer()
    
    var count = 18 
    
    func result() {
        count = count - 1
        time.text = "\(count)"
        
        if count <= 0 {
            timer.invalidate()
            //count = 10
            //time.text = "10"
            }
    }
    
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        if let questionsPlistPath = NSBundle.mainBundle().pathForResource("Questions", ofType: "plist") {
            println(questionsPlistPath)
            if let questionPlistPath = NSData(contentsOfFile: questionsPlistPath) {
                if let questionRosterArray = NSPropertyListSerialization.propertyListWithData(questionPlistPath, options: NSPropertyListReadOptions(), format: nil, error: nil) as? Array<Dictionary<String, AnyObject>>{
                    println(questionRosterArray[0])
                    self.questionRosterArray = questionRosterArray
                }
            }
        }
        
        
    
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    
}
