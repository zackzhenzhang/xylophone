//
//  SoundPlayer.swift
//  Quizzler
//
//  Created by Zack Zhang on 2019/10/1.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

class AnimationPlayer{
    
    var image : UIImageView! = nil
    
    let DefaultAnimationDuration : Double = 1
    
    init(_ image : UIImageView!){
        self.image = image
    }
    
    func showAndHideImage( _ duration : Double = 1) {
        
        image.isHidden = false
                
        DispatchQueue.main.asyncAfter(deadline: (.now() + duration)) {
            self.image.isHidden = true
        }
    }
}
