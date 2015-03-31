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
    
    
    
    
    
    
    
    @IBAction func answerOneButton(sender: UIButton) {
        answerOneText.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
        //NSDictionary *section1 = [sectionDictionary objectForKey:@"Section1"];
        //questionText.text = "\(questionRosterArray[1] <String:>())"
        
      
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
                    println(questionRosterArray[1])
                    self.questionRosterArray = questionRosterArray
                }
            }
        }
        
        
    
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    
}
