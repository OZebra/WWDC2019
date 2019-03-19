//
//  JBPickle.swift
//  KitchenHero
//
//  Created by jose on 18/03/19.
//  Copyright © 2019 jose. All rights reserved.
//

import Foundation
import SpriteKit


class JBpickle: SKSpriteNode{
    
    var pickle = SKSpriteNode()
    var pickleAtlas = SKTextureAtlas()
    var pickleArray = [SKTexture]()
    var pSize = CGSize(width: 100, height: 140)
    init(){
        super.init(texture: nil, color:UIColor.clear, size: pSize)
        
        loadPickle()
        loadPicklePhysicsBody(size: pSize)
        
    }
    
    func loadPicklePhysicsBody(size: CGSize){
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = pickleCategory
        physicsBody?.isDynamic = true
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.affectedByGravity = false
    }
    
    func loadPickle(){
        pickleAtlas = SKTextureAtlas(named: "pickle.atlas")
        for i in 1...pickleAtlas.textureNames.count{
            pickleArray.append(SKTexture(imageNamed: "pickle_\(i).png"))
        }
        //Initializing the node
        pickle = SKSpriteNode(imageNamed: pickleAtlas.textureNames[0] as String)
        pickle.size = self.size
        pickle.position = self.position
        pickle.anchorPoint = self.anchorPoint
        //pickles.append(pickle)
        addChild(pickle)
    }
    func move(){
        //This function only adds velocity
        physicsBody?.velocity = CGVector(dx: -200, dy: 0)
    }
    
    func bite(){
        //Mr.pickle bite animation
        let biteAni = SKAction.animate(with: pickleArray, timePerFrame: 0.1)
        pickle.run(SKAction.repeatForever(biteAni))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
}
