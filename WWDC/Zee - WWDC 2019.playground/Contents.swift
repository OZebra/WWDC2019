/*:
 
 # Zee Adventure!
 ## A quick travel through the physics world!
 ![The real head of the household?](blinkingzeebg.png)

 
 ## Why Zee Adventure?
 ### Zee is a brief experience into the physics of SpriteKit. With some simples levels and basic mechanics, the player get to know better some of the most powerful tools of the SpriteKit diving into a whole new world of possibilities.
 
 ## Walking through Zee Adventure!
 ### Zee Adventure! is composed of 4 levels. The first three levels will teach you the different mechanics of the game, and the last one will defy you to solve a fun puzzle using the previous mechanics that you learned.
 
 ## Elements and Mechanics
  ![The real head of the household?](what.png)
 
 ### Each level name has to do with the kind of powerup that you will learn to use.
 
 ## Final Considerations
 ### For me, the whole motivation of making this playground was to learn a little bit more about swift and about this wonderful development kit for games (SpriteKit). Once I realised all the things that I could do by just playing with some of is properties, I was completely amazed. It was a very rewarding experience and i'm very proud of what i did.

 */

import PlaygroundSupport
import SpriteKit


// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
