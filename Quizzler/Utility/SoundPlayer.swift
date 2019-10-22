//
//  SoundPlayer.swift
//  Quizzler
//
//  Created by Zack Zhang on 2019/10/1.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
import AVFoundation

class SoundPlayer{
    static var player: AVAudioPlayer?
    
    
    static func playCorrectSound(){
        playSound("correct","wav")
    }
    
    static func playWrongSound(){
        playSound("wrong","wav")
    }
    
    static func playSound(_ fileName:String, _ fileFormat: String){
        print("playing \(fileName).\(fileFormat)")
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else {
                return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
