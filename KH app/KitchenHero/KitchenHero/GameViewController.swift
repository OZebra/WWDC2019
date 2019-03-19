//
//  GameViewController.swift
//  KitchenHero
//
//  Created by jose on 18/03/19.
//  Copyright © 2019 jose. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting view configurations
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = true
        
        //Creating and preparing the scene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        
        //Showing scene
        skView.presentScene(scene)
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
