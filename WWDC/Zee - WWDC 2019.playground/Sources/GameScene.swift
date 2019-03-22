import Foundation
import SpriteKit

public class GameScene: SKScene, SKPhysicsContactDelegate{
    
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
        backgroundColor = #colorLiteral(red: 0.7503463938, green: 0.7174448451, blue: 0.9686274529, alpha: 1)
        
        //Setting PhyWorld=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=---=-=-=-==-=-
        setPhysicsWorld()
        
        //levelLabel=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        startLevelText(level: 1)
        
        //startLabel=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        tapToStartText()
        
        //applyForce=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let applyForce = SKSpriteNode(imageNamed: "applyForce.png")
        applyForce.size = CGSize(width: 30, height: 30)
        applyForce.position.x = -400 + 35 + applyForce.size.width/2
        applyForce.position.y = 240 - applyForce.size.height - 100
        applyForce.name = "applyForce"
        
        applyForce.physicsBody = SKPhysicsBody(circleOfRadius: applyForce.size.width/2)
        applyForce.physicsBody?.isDynamic = false
        applyForce.physicsBody?.usesPreciseCollisionDetection = true
        applyForce.physicsBody?.affectedByGravity = false
        applyForce.physicsBody?.categoryBitMask = forceCategory
        
        addChild(applyForce)
        
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
        edgy.physicsBody?.collisionBitMask = enemyCategory
        edgy.position.x = 50
        edgy.position.y = -200
        addChild(edgy)
        
        //zee=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        
        let zee = SKSpriteNode(imageNamed: "zee.png")
        zee.name = "zee"
        zee.size = CGSize(width: 50, height: 50)
        zee.physicsBody = SKPhysicsBody(circleOfRadius: 25)
        zee.physicsBody?.isDynamic = true
        zee.physicsBody?.usesPreciseCollisionDetection = true
        zee.physicsBody?.affectedByGravity = false
        zee.physicsBody?.restitution = 0
        zee.physicsBody?.friction = 10
        zee.physicsBody?.angularDamping = 0
        zee.physicsBody?.linearDamping = 0
        zee.physicsBody?.collisionBitMask = enemyCategory | floorCategory
        zee.physicsBody?.categoryBitMask = zeeCategory
        zee.physicsBody?.contactTestBitMask = enemyCategory | floorCategory | goalCategory | forceCategory
        zee.position.x = -300
        zee.position.y = -200
        addChild(zee)
        
        //Floor=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let floor = SKSpriteNode(color: #colorLiteral(red: 0.2784313725, green: 0.2784313725, blue: 0.2784313725, alpha: 1), size: CGSize(width: 1000, height: 50))
        floor.position.x = 0
        floor.position.y = -250
        floor.name = "floor"
        floor.physicsBody = SKPhysicsBody(rectangleOf: floor.size)
        floor.physicsBody?.isDynamic = false
        floor.physicsBody?.usesPreciseCollisionDetection = false
        floor.physicsBody?.affectedByGravity = false
        floor.physicsBody?.friction = 10
        floor.physicsBody?.categoryBitMask = floorCategory
        addChild(floor)
        
        //goal=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let goal = SKSpriteNode(imageNamed: "goal.png")
        goal.size = CGSize(width: 83*0.9, height: 87*0.9)
        goal.name = "goal"
        
        goal.physicsBody = SKPhysicsBody(rectangleOf: goal.size)
        goal.physicsBody?.isDynamic = false
        goal.physicsBody?.usesPreciseCollisionDetection = true
        goal.physicsBody?.affectedByGravity = false
        goal.physicsBody?.categoryBitMask = goalCategory
        
        goal.position.x = 300
        goal.position.y = floor.position.y + floor.size.height/2 + goal.size.height/2
        addChild(goal)
        
        
        //ready=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
        let ready = SKSpriteNode(imageNamed: "ready.png")
        ready.size = CGSize(width: 35, height: 35)
        ready.name = "ready"
        ready.position.x = -350
        ready.position.y = 180
        addChild(ready)
        
        /*=======================End declarations===========================*/
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
            let tapStart = childNode(withName: "taptostart")
            let levelLabel = childNode(withName: "levelLabel")
            levelLabel?.removeFromParent()
            tapStart?.removeFromParent()
        }
        for t in touches{
            let ready = childNode(withName: "ready")
            let zee = childNode(withName: "zee")
            if (ready?.contains(t.location(in: self)))!{
                isReady = true
                zee?.physicsBody?.velocity = CGVector(dx: 250, dy: 0)
                zee?.physicsBody?.affectedByGravity = true
            }
            
            let pos = t.location(in: self)
            let applyForce = childNode(withName: "applyForce")
            //This if prevents the game from crashing once the powerup is poped out
            if applyForce?.parent != nil{
                if (applyForce?.contains(pos))!{
                    didClickIcon = true
                }
            }else{
                print("Ap out of view")
            }
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            let pos = t.location(in: self)
            let applyForce = childNode(withName: "applyForce")
            
            if didClickIcon {
                applyForce?.position = pos
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
        let zee = childNode(withName: "zee")
        
        if !self.contains((zee?.position)!){
            winOrLose(state: false)
        }
    }
    public func didBegin(_ contact: SKPhysicsContact) {
        
        let zeee = childNode(withName: "zee")
        let applyForcee = childNode(withName: "applyForce")
        let goal = childNode(withName: "goal")
        
        //This if prevents the game from crashing once the powerup is poped out
        if applyForcee?.parent != nil {
            //This if controls if zee got to the goal
            if ((contact.bodyA.node! == applyForcee && contact.bodyB.node! == zeee)){
                zeee?.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 50))
                applyForcee?.removeFromParent()
            }
        }
        
        if((contact.bodyA.node! == goal && contact.bodyB.node! == zeee) || (contact.bodyA.node! == zeee && contact.bodyB.node! == goal)){
            winOrLose(state: true)
        }
    }
    
    func winOrLose(state: Bool){
        let message = SKLabelNode()
        if state {
            message.name = "won"
            message.text = "Congratulations!"
        }else{
            message.name = "lost"
            message.text = "You lost :/"
        }
        message.position.x = 0
        message.position.y = 0
        message.fontName = "San Francisco"
        message.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        message.fontSize = 80.0
        addChild(message)
    }
    func startLevelText(level: Int){
        let levelLabel = SKLabelNode(text: levelTitles[level-1])
        levelLabel.name = "levelLabel"
        levelLabel.position.x = 0
        levelLabel.position.y = 0
        levelLabel.fontName = "San Francisco"
        levelLabel.fontColor = #colorLiteral(red: 0.1394042671, green: 0.1394042671, blue: 0.1394042671, alpha: 1)
        levelLabel.fontSize = 50.0
        addChild(levelLabel)
    }
    func tapToStartText(){
        let startLabel = SKLabelNode(text: "Tap to start!")
        startLabel.name = "taptostart"
        startLabel.position.x = 0
        startLabel.position.y = -30
        startLabel.fontName = "San Francisco"
        startLabel.fontColor = #colorLiteral(red: 0.1457686126, green: 0.1457686126, blue: 0.1457686126, alpha: 1)
        startLabel.fontSize = 20.0
        addChild(startLabel)
        startLabel.run(SKAction.repeatForever(fadeio))
    }
    func setPhysicsWorld(){
        physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -4)
    }
}
