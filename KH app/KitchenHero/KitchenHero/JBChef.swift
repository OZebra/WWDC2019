//
//  JBChef.swift
//  KitchenHero
//
//  Created by jose on 18/03/19.
//  Copyright © 2019 jose. All rights reserved.
//

import Foundation
import SpriteKit


class JBChef: SKSpriteNode{
    
    var chef = SKSpriteNode()
    var chefAtlas = SKTextureAtlas()
    var chefArray = [SKTexture]()
    
    init(){
        let cSize = CGSize(width: 80, height: 80)
        super.init(texture: nil, color:UIColor.clear, size: cSize)
        loadChef()
        loadPhysicsBodyWithSize(size: cSize)
    }
    
    func loadPhysicsBodyWithSize(size: CGSize){
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = chefCategory
        physicsBody?.contactTestBitMask = pickleCategory
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.isDynamic = false //if true it will react to the knife throwing (*take a note)
        physicsBody?.affectedByGravity = false
    }
    
    func throwKnife(){
        //Execute the throwing animation
        let throwAni = SKAction.animate(with: chefArray, timePerFrame: 0.07)
        //chef.run(SKAction.repeatForever(throwAni))
        chef.run(throwAni)
    }
    
    func loadChef(){
        //This function is just for organization purposes and it configures the chef`s atlas and stuff
        chefAtlas = SKTextureAtlas(named: "chef.atlas")
        for i in 1...chefAtlas.textureNames.count{
            chefArray.append(SKTexture(imageNamed: "chef_\(i).png"))
        }
        chef = SKSpriteNode(imageNamed: chefAtlas.textureNames[0] as String)
        chef.size = self.size
        chef.position = self.position
        chef.anchorPoint = self.anchorPoint
        addChild(chef)
    }
    
    func Throw(){
        //Execute the creation of the knife node
        self.run(SKAction.playSoundFileNamed("Throw.mp3", waitForCompletion: false))
        
        //This entire part is about creating the knife that the chef will throw==
        let knife = SKSpriteNode(imageNamed: "knife.png")
        //Setting knife mechanics and it`s physical body
        knife.position = chef.position
        knife.position.x += 20
        knife.physicsBody = SKPhysicsBody(circleOfRadius: knife.size.width / 2)
        knife.physicsBody?.isDynamic = true
        
        knife.physicsBody?.categoryBitMask = knifeCategory
        knife.physicsBody?.contactTestBitMask = pickleCategory
        
        knife.physicsBody?.usesPreciseCollisionDetection = true
        knife.physicsBody?.affectedByGravity = false
        knife.physicsBody?.velocity = CGVector(dx: 400, dy: 0)
        //=======================================================================
        
        self.addChild(knife)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
}

/*
 class JBChef: SKSpriteNode{
 
 
 
 init(){
 super.init(texture: nil, color:UIColor.red, size: CGSize(width: 50, height: 50))
 }
 
 /*
 pickleAtlas = SKTextureAtlas(named: "pickle")
 for i in 1...pickleAtlas.textureNames.count{
 pickleArray.append(SKTexture(imageNamed: "pickle_\(i).png"))
 }
 pickle = SKSpriteNode(imageNamed: pickleAtlas.textureNames[0] as String)
 pickle.size = CGSize(width: -100, height: 140)
 pickle.position = CGPoint(x: 150, y: myFloor.position.y + myFloor.frame.size.height/2 + pickle.frame.size.height/2)
 addChild(pickle)
 */
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(Coder:) has not been implemented")
 }
 }
*/
