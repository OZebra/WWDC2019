//
//  GameScene.swift
//  KitchenHero
//
//  Created by jose on 18/03/19.
//  Copyright © 2019 jose. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var myFloor: JBFloor!
    var chef: JBChef!
    var pickle: JBpickle!
    var start_flag: Bool!
    var end_flag: Bool!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = #colorLiteral(red: 1, green: 0.7037119486, blue: 0.2687823581, alpha: 1)
        
        start_flag = false
        end_flag = false
        
        //Adding Floor
        myFloor = JBFloor(size:CGSize(width:view.frame.width, height: 50))
        myFloor.position = CGPoint(x: 0, y: 20)
        addChild(myFloor)
        //EndFloor
        
        //Adding Chef
        chef = JBChef()
        chef.position = CGPoint(x: 200, y: myFloor.position.y + myFloor.frame.size.height/2 + chef.frame.size.height/2)
        addChild(chef)
        
        //Adding Pickle
        pickle = JBpickle()
        pickle.position = CGPoint(x: 700, y: myFloor.position.y + myFloor.frame.size.height/2 + pickle.frame.size.height/2)
        addChild(pickle)
        
        //Making start label
        let tapLabel = SKLabelNode(text: "Tap to Start!")
        tapLabel.name = "Tap to start Label"
        tapLabel.position.x = view.center.x
        tapLabel.position.y = view.center.y + 40
        tapLabel.fontName = "Helvetica"
        tapLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tapLabel.fontSize = 80.0
        addChild(tapLabel)
        //End StartLabel

        //Adding PHYSICS!
        physicsWorld.contactDelegate = self
        
    }
    func endGame(){
        //Avengers rs
        end_flag = true
        
        //Stop game
        chef.physicsBody = nil
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(start_flag == false){
            
            let tapStart = childNode(withName: "Tap to start Label")
            tapStart?.removeFromParent()
            
            myFloor.start()
            pickle.bite()
            pickle.move()
            start_flag = true
        }
        else{
            chef.throwKnife()
            chef.Throw()
        }
    }
    // MARK: - SKPhysicsContactDelegate
    func didBegin(_ contact: SKPhysicsContact) {
        //This function prints if any of the testbitmasks have been summoned
        print("Did begin contact called")
    }
    /*
    func touchDown(atPoint pos : CGPoint) {
        chef.throwKnife()
    }
    /*
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
     */*/
}
