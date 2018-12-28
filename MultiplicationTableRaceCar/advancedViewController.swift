//
//  advancedViewController.swift
//  MultiplicationTable
//
//  Created by Chang Sophia on 2018/9/11.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import GameKit
import AVFoundation

class advancedViewController: UIViewController {
    var player: AVPlayer?
    
    
  
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
    @IBOutlet weak var enemyAns: UILabel!
    @IBOutlet weak var myNumberA: UILabel!
    @IBOutlet weak var myNumberB: UILabel!
    @IBOutlet weak var enemyNumberA: UILabel!
    @IBOutlet weak var enemyNumberB: UILabel!
    
    var newMyNumbers: ArraySlice<String> = []
    var newEnemyNumbers: ArraySlice<String> = []
    var newSigns: ArraySlice<String> = []
    var newMyAns: ArraySlice<String> = []
    var newEnemyAns: ArraySlice<String> = []
    let mynumbers = ["number_1","number_2","number_3","number_4","number_5","number_6","number_7","number_8","number_9"]
     let enemynumbers = ["number_1","number_2","number_3","number_4","number_5","number_6","number_7","number_8","number_9"]
    let multipleAns = ["4", "6", "8", "9", "10", "12", "14", "15", "16", "18", "20", "21", "24", "25", "27", "28", "30", "32", "35", "36", "40", "42", "45", "48", "49", "54", "56", "63", "64", "72","81"]
    let addAns = ["2", "2", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    let signs = ["add", "deduct", "multiply", "divide"]
    
    @IBAction func addButtonPreseed(_ sender: Any) {
         newMyNumbers = mynumbers.shuffled()[0...2]
         newEnemyNumbers = enemynumbers.shuffled()[0...2]
        enemyNumberA.text = enemynumbers[0]
        enemyNumberB.text = enemynumbers[1]
        
         newMyAns = multipleAns.shuffled()[0...2]
         newEnemyAns = addAns.shuffled()[0...2]
         let myanswerIndex = Int.random(in: 0...30)
         let enemyanswerIndex = Int.random(in: 0...30)
         myAns.text = multipleAns[myanswerIndex]
      

         myButton1.setTitle(newMyAns[0], for: UIControl.State.normal)
         myButton2.setTitle(newMyAns[1], for: UIControl.State.normal)
         myButton3.setTitle(newMyAns[2], for: UIControl.State.normal)
        myImageViewA.image = UIImage(named: newMyNumbers[0])
        myImageViewB.image = UIImage(named: newMyNumbers[1])
        
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
        
        //add
       
        
            
    }
   
    
    
    
    @IBAction func myAnsButtonPressed(_ sender: UIButton) {
     
        if sender == myButton1 {
            if myAns.text ==  newMyNumbers[0] {
                self.mySlider.value = Float(self.mySlider.value - 1)}
            else {self.mySlider.value = Float(self.mySlider.value + 1)}
        } else if sender == myButton2 {
            if myAns.text ==  newMyNumbers[1] {
                self.mySlider.value = Float(self.mySlider.value - 1)}
            else {self.mySlider.value = Float(self.mySlider.value + 1)}
        } else if sender == myButton3 {
            if myAns.text ==  newMyNumbers[2] {
                self.mySlider.value = Float(self.mySlider.value - 1)}
            else {self.mySlider.value = Float(self.mySlider.value + 1)}
        }
            if myAns.text ==  newMyAns[0]{
                if let url = Bundle.main.url(forResource: "correct", withExtension: "mp4"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            } else {
                if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4"){
                    player = AVPlayer(url: url)
                    player?.play()
                }
            }
    }
   
    @IBAction func enemyAnsButtonPressed(_ sender: UIButton) {
    
        if sender == enemyButton1 {
            if enemyAns.text ==  newEnemyNumbers[0] {
                self.enemySlider.value = Float(self.enemySlider.value + 1)}
            else {self.enemySlider.value = Float(self.enemySlider.value - 1)}
        } else if sender == enemyButton2 {
            if enemyAns.text ==  newEnemyNumbers[1] {
                self.enemySlider.value = Float(self.enemySlider.value + 1)}
            else {self.enemySlider.value = Float(self.enemySlider.value - 1)}
        } else if sender == enemyButton3 {
            if enemyAns.text ==  newEnemyNumbers[2] {
                self.enemySlider.value = Float(self.enemySlider.value + 1)}
            else {self.enemySlider.value = Float(self.enemySlider.value - 1)}
        }
        if enemyAns.text ==  newEnemyAns[0]{
            if let url = Bundle.main.url(forResource: "correct", withExtension: "mp4"){
                player = AVPlayer(url: url)
                player?.play()
            }
        } else {
            if let url = Bundle.main.url(forResource: "incorrect", withExtension: "mp4"){
                player = AVPlayer(url: url)
                player?.play()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
