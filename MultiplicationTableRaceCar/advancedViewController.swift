//
//  advancedViewController.swift
//  MultiplicationTable
//
//  Created by Chang Sophia on 2018/9/11.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation
import GameKit

var newMyNumbers: ArraySlice<String> = []
var newEnemyNumbers: ArraySlice<String> = []
var newSigns: ArraySlice<String> = []
var newMyAns: ArraySlice<String> = []
var newEnemyAns: ArraySlice<String> = []
var myNumberA = 0
var myNumberB = 0
class advancedViewController: UIViewController {
    var player: AVPlayer?
    var sign = ""
    
  
    @IBOutlet weak var myImageViewA: UIImageView!
    @IBOutlet weak var myImageViewB: UIImageView!
    @IBOutlet weak var enemyImageViewA: UIImageView!
    @IBOutlet weak var enemyImageViewB: UIImageView!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var deduct: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var myButton1: UIButton!
    @IBOutlet weak var myButton2: UIButton!
    @IBOutlet weak var myButton3: UIButton!
    @IBOutlet weak var enemyButton1: UIButton!
    @IBOutlet weak var enemyButton2: UIButton!
    @IBOutlet weak var enemyButton3: UIButton!
    @IBOutlet weak var mySlider: RaceCarSlider!
    @IBOutlet weak var enemySlider: RaceCarSlider!
    @IBOutlet weak var myAns: UILabel!
    @IBOutlet weak var myResultAns: UILabel!
    @IBOutlet weak var enemyAns: UILabel!
    @IBOutlet weak var myNumberA: UILabel!
    @IBOutlet weak var myNumberB: UILabel!
    @IBOutlet weak var enemyNumberA: UILabel!
    @IBOutlet weak var enemyNumberB: UILabel!
    
  
    let mynumbers = ["1","2","3","4","5","6","7","8","9"]
     let enemynumbers = ["1","2","3","4","5","6","7","8","9"]
    let multipleAns = ["4", "6", "8", "9", "10", "12", "14", "15", "16", "18", "20", "21", "24", "25", "27", "28", "30", "32", "35", "36", "40", "42", "45", "48", "49", "54", "56", "63", "64", "72","81"]
    let addAns = ["2", "2", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    let signs = ["add", "deduct", "multiply", "divide"]
    
    @IBAction func addButtonPreseed(_ sender: Any) {
         sign = "multiple"
         newMyNumbers = mynumbers.shuffled()[0...2]
         newMyAns = multipleAns.shuffled()[0...2]
         myButton1.setTitle(newMyAns[0], for: UIControl.State.normal)
         myButton2.setTitle(newMyAns[1], for: UIControl.State.normal)
         myButton3.setTitle(newMyAns[2], for: UIControl.State.normal)
         myImageViewA.image = UIImage(named: newMyNumbers[0])
         myImageViewB.image = UIImage(named: newMyNumbers[1])
       
    //String to Int
        let text1 = "\(String(describing: myNumberA)))"
        let text2 = "\(String(describing: myNumberB)))"
        myNumberA.text = newMyNumbers[0]
        myNumberB.text = newMyNumbers[1]
        if let number1 = Int(text1), let number2 = Int(text2){
        var myresultIndex = 0
         myresultIndex = number1 * number2
           myResultAns.text = "\(myresultIndex)"
        }
      
        
        
        let answerIndex = Int.random(in: 0...1)
        myAns.text = newMyAns[answerIndex]
       
        
        newEnemyNumbers = enemynumbers.shuffled()[0...2]
        newEnemyAns = addAns.shuffled()[0...2]
       
        
        let enemyanswerIndex = Int.random(in: 0...1)
        enemyAns.text = newEnemyAns[enemyanswerIndex]
    
        enemyNumberA.text =  newEnemyNumbers[0]
        enemyNumberB.text =  newEnemyNumbers[1]
        
        
        enemyButton1.setTitle(newEnemyAns[0], for: UIControl.State.normal)
        enemyButton2.setTitle(newEnemyAns[1], for: UIControl.State.normal)
        enemyButton3.setTitle(newEnemyAns[2], for: UIControl.State.normal)
        enemyImageViewA.image = UIImage(named: newEnemyNumbers[0])
        enemyImageViewB.image = UIImage(named: newEnemyNumbers[1])
        enemyImageViewA.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyImageViewB.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyButton1.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyButton2.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyButton3.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyAns.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyNumberA.transform = CGAffineTransform(scaleX: -1, y: -1)
        enemyNumberB.transform = CGAffineTransform(scaleX: -1, y: -1)
        
       
        
            
    }
    
    @IBAction func myAnsButtonPressed(_ sender: UIButton) {
    if sender == myButton1 {
            if myAns.text ==  newMyNumbers[0] {
                self.mySlider.value = Float(self.mySlider.value - 1)
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
            else {self.mySlider.value = Float(self.mySlider.value + 1)
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
        } else if sender == myButton2 {
            if myAns.text ==  newMyNumbers[1] {
                self.mySlider.value = Float(self.mySlider.value - 1)
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
            else {self.mySlider.value = Float(self.mySlider.value + 1)
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
        } else if sender == myButton3 {
            if myAns.text ==  newMyNumbers[2] {
                self.mySlider.value = Float(self.mySlider.value - 1)
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
            else {self.mySlider.value = Float(self.mySlider.value + 1)
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
        }
    }
        
        
    @IBAction func enemyAnsButtonPressed(_ sender: UIButton) {
        
        if sender == enemyButton1 {
            if enemyAns.text ==  newEnemyNumbers[0] {
                self.enemySlider.value = Float(self.enemySlider.value + 1)
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
            else {self.enemySlider.value = Float(self.enemySlider.value - 1)
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
        } else if sender == enemyButton2 {
            if enemyAns.text ==  newEnemyNumbers[1] {
                self.enemySlider.value = Float(self.enemySlider.value + 1)
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
            else {self.enemySlider.value = Float(self.enemySlider.value - 1)
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
        } else if sender == enemyButton3 {
            if enemyAns.text ==  newEnemyNumbers[2] {
                self.enemySlider.value = Float(self.enemySlider.value + 1)
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
            else {self.enemySlider.value = Float(self.enemySlider.value - 1)
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton1.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        myButton2.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        myButton3.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        enemyButton1.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        enemyButton2.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        enemyButton3.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        // Do any additional setup after loading the view.
    }
}


