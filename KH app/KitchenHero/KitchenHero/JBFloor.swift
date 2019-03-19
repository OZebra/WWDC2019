//
//  JBMovingGround.swift
//  KitchenHero
//
//  Created by jose on 18/03/19.
//  Copyright © 2019 jose. All rights reserved.
//

import Foundation
import SpriteKit

class JBFloor: SKSpriteNode{
    //Creating constants for better reading of the code
    let NUMBER_OF_SEGMENTS = 20
    let COLOR_ONE = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let COLOR_TWO = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    init(size: CGSize){
        //Setting the floor configuration
        super.init(texture: nil, color: UIColor.brown, size: CGSize(width: size.width*2, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0.5)
        
        //Setting the segments of the tiles of the floor
        for i in 0..<NUMBER_OF_SEGMENTS{
            var segmentColor: UIColor!
            if i%2 == 0 {
                segmentColor = COLOR_ONE
            }
            else{
                segmentColor = COLOR_TWO
            }
            //Segment color and positioning settings
            let segment = SKSpriteNode(color: segmentColor, size: CGSize(width: self.size.width/CGFloat(NUMBER_OF_SEGMENTS), height: self.size.height))
            segment.anchorPoint = CGPoint(x: 0, y: 0.5)
            segment.position = CGPoint(x: CGFloat(i)*segment.size.width, y: 0)
            addChild(segment)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
    
    func start(){
        let moveLeft = SKAction.moveBy(x:-frame.size.width/2, y:0, duration: 1.0)
        let resetPosition = SKAction.moveTo(x: 0, duration: 0)
        let moveSequence = SKAction.sequence([moveLeft, resetPosition])
        
        run(SKAction.repeatForever(moveSequence))
    }
}
