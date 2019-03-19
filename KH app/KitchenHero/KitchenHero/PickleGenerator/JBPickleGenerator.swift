//
//  JBPickleGenerator.swift
//  KitchenHero
//
//  Created by jose on 19/03/19.
//  Copyright © 2019 jose. All rights reserved.
//

import Foundation
import SpriteKit

class JBPickleGenerator: SKSpriteNode{
    
    var genTimer: Timer?
    
    func startGenerationEvery(seconds: TimeInterval, wave: Int){
        
        var i = (wave*wave) - (wave*2)
        
        repeat{
            genTimer = Timer.scheduledTimer(timeInterval: seconds, target: self, selector: Selector(("generatePickle")), userInfo: nil, repeats: false)
            i -= 1
        } while(i > 0)
    }
    
    func generatePickle(){
        let pickle = JBpickle()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
}
