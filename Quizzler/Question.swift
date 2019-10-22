//
//  Question.swift
//  Quizzler
//
//  Created by Zack Zhang on 2019/9/26.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    
    var questionText : String
    var answer : Bool
    
    init(text questionText: String, correctAnswer answer: Bool){
        
        self.questionText = questionText
        self.answer = answer
    }
}
