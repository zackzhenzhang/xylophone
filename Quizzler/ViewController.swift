//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionIndex : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
     
    @IBOutlet weak var wrongPopUpImage: UIImageView!
    @IBOutlet weak var correctPopUpImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[questionIndex].questionText
        
        correctPopUpImage.isHidden = true
        wrongPopUpImage.isHidden = true
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAnswer = true
        } else{
            pickedAnswer = false
        }
        
        _ = checkAnswer()
        
        
        nextQuestion()
        
        updateUI()
        
    }
    
    
    func updateUI() {
        
        questionLabel.text = allQuestions.list[questionIndex].questionText
        
        scoreLabel.text = "Score: \(score)"
    }
    
    func checkAnswer() ->Bool {
        if allQuestions.list[questionIndex].answer == pickedAnswer {
            score += 10
            SoundPlayer.playCorrectSound()
            AnimationPlayer(self.correctPopUpImage).showAndHideImage()
            
            return true
        }
        SoundPlayer.playWrongSound()
        AnimationPlayer(self.wrongPopUpImage).showAndHideImage()

        return false
    }
    
    
    func nextQuestion() {
        
        if (allQuestions.list.count - 1) == questionIndex{
            questionIndex = 0
        }
        else {
            questionIndex += 1
        }
        
    }
    
    func startOver() {
        
    }
}
