import Foundation
import SpriteKit

public class GameScene: SKScene {
    
    public var isReady: Bool!
    public var start_flag: Bool!
    public var click_pos: CGPoint!
    public let fadeio = SKAction.sequence([
        SKAction.fadeAlpha(to: 0.2, duration: 0.5),
        SKAction.fadeAlpha(to: 1, duration: 1)
        ])
    
    public override func didMove(to view: SKView) {
        
        start_flag = false
        isReady = false
        self.size = view.frame.size
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        //startLabel=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let startLabel = SKLabelNode(text: "Tap to Start!")
        startLabel.name = "Tap to start Label"
        startLabel.position.x = 0
        startLabel.position.y = 0
        startLabel.fontName = "San Francisco"
        startLabel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        startLabel.fontSize = 50.0
        addChild(startLabel)
        
        //icon=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let icon = SKSpriteNode(imageNamed: "powerup.png")
        icon.size = CGSize(width: 30, height: 30)
        icon.position.x = 50
        icon.position.y = -200
        icon.name = "icon"
        addChild(icon)
        
        //edgy=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let edgy = SKSpriteNode(imageNamed: "edgy.png")
        edgy.name = "enemy"
        edgy.size = CGSize(width: 50, height: 50)
        edgy.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        edgy.physicsBody?.isDynamic = false
        edgy.physicsBody?.usesPreciseCollisionDetection = true
        edgy.physicsBody?.affectedByGravity = false
        edgy.physicsBody?.restitution = 0
        edgy.physicsBody?.friction = 10
        edgy.physicsBody?.angularDamping = 0
        edgy.physicsBody?.linearDamping = 0
        edgy.position.x = 200
        edgy.position.y = -100
        addChild(edgy)
        
        //hero=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let hero = SKSpriteNode(imageNamed: "hero.png")
        hero.name = "hero"
        hero.size = CGSize(width: 50, height: 50)
        hero.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        hero.physicsBody?.isDynamic = true
        hero.physicsBody?.usesPreciseCollisionDetection = true
        hero.physicsBody?.affectedByGravity = false
        hero.physicsBody?.restitution = 0
        hero.physicsBody?.friction = 10
        hero.physicsBody?.angularDamping = 0
        hero.physicsBody?.linearDamping = 0
        hero.position.x = -300
        hero.position.y = -200
        addChild(hero)
        
        //Floor=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let floor = SKSpriteNode(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), size: CGSize(width: 1000, height: 50))
        floor.position.x = 0
        floor.position.y = -260
        floor.physicsBody = SKPhysicsBody(rectangleOf: floor.size)
        floor.physicsBody?.isDynamic = false
        floor.physicsBody?.usesPreciseCollisionDetection = true
        floor.physicsBody?.affectedByGravity = false
        floor.physicsBody?.friction = 10
        addChild(floor)
        
        //goal=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let goal = SKSpriteNode(imageNamed: "goal.png")
        goal.size = CGSize(width: 83*0.9, height: 87*0.9)
        goal.name = "goal"
        goal.position.x = 300
        goal.position.y = 50
        addChild(goal)
        
        //ready=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let ready = SKSpriteNode(imageNamed: "ready.png")
        ready.size = CGSize(width: 35, height: 35)
        ready.name = "ready"
        ready.position.x = -350
        ready.position.y = 180
        addChild(ready)
        
        /*=======================End declarations===========================*/
        
        //Setting PhyWorld===============================
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -4)
        //Is working against me (8)
        
        //Fade loop=======================================
        startLabel.run(SKAction.repeatForever(fadeio))
        
    }
    
    @objc public static override var supportsSecureCoding: Bool {
        // It just came with the basic template, so i thought it as
        // a good idea to let it stay
        get {
            return true
        }
    }
    
    public var didClickIcon: Bool = false
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !start_flag{
            start_flag = true
            let tapStart = childNode(withName: "Tap to start Label")
            tapStart?.removeFromParent()
        }
        for t in touches{
            let ready = childNode(withName: "ready")
            let ball = childNode(withName: "hero")
            if (ready?.contains(t.location(in: self)))!{
                isReady = true
                ball?.physicsBody?.velocity = CGVector(dx: 250, dy: 0)
                ball?.physicsBody?.affectedByGravity = true
            }
            
            let pos = t.location(in: self)
            let icon = childNode(withName: "icon")
            
            if (icon?.contains(pos))!{
                //                icon?.position = pos
                didClickIcon = true
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            let pos = t.location(in: self)
            let icon = childNode(withName: "icon")
            
            if didClickIcon {
                icon?.position = pos
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        didClickIcon = false
    }
    //
    //    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { touchUp(atPoint: t.location(in: self)) }
    //    }
    //
    public override func update(_ currentTime: TimeInterval) {
        let ball = childNode(withName: "hero")
        let icon = childNode(withName: "icon")
        let goal = childNode(withName: "goal")
        
        if (goal?.contains(CGPoint(x: (ball?.position.x)! + ((ball?.frame.size.width)!/2), y: (ball?.position.y)!)))!{
            let wonLevel = SKLabelNode(text: "Level Won!")
            wonLevel.name = "won"
            wonLevel.position.x = 0
            wonLevel.position.y = 0
            wonLevel.fontName = "San Francisco"
            wonLevel.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            wonLevel.fontSize = 80.0
            addChild(wonLevel)
            //            ball?.physicsBody?.velocity = CGVector(dx: 0, dy: 200)
        }
        
        if (icon?.contains(CGPoint(x: (ball?.position.x)! + ((ball?.frame.size.width)!/2), y: (ball?.position.y)!)))!{
            ball?.physicsBody?.applyForce(CGVector(dx: 0, dy: 513))
        }
        
        if !self.contains((ball?.position)!){
            self.removeAllChildren() //Throws some error
            let EndGame = SKLabelNode(text: "Game Over!")
            EndGame.name = "Over"
            EndGame.position.x = 0
            EndGame.position.y = 0
            EndGame.fontName = "San Francisco"
            EndGame.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            EndGame.fontSize = 80.0
            addChild(EndGame)
        }
    }
}
