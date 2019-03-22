import Foundation
import SpriteKit

let zeeCategory: UInt32 = 0x1 << 0
let goalCategory: UInt32 = 0x1 << 1
let enemyCategory: UInt32 = 0x1 << 2
let forceCategory: UInt32 = 0x1 << 3
//let agravityCategory: UInt32 = 0x1 << 4
//let resolveCategory: UInt32 = 0x1 << 5
let floorCategory: UInt32 = 0x1 << 7

//In this section I'll define all the title constants, all well as the guiding texts of each level.

//Level 1 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
let titleLevel1: String = "Level 1 - Just a little push"
let gtLevel1: [String] = [
    "On the first Zee Adventure level, we will get to learn about force.",
    "First, you'll have to put the green powerup into Zee's path.",
    "The powerup will apply a force on Zee on the yellow arrow direction.",
    "Use that powerup to pass above the enemy and get to the exit."
]
/*
 Now we will learn about gravity. In this level, you will have to use the <cor> powerup to reverse the gravity of the world and get Zee to the exit before he falls from the cliff.

 */
//Level 2 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
let titleLevel2: String = "Level 2 - Is working !against me"
let gtLevel2: [String] = [
    "Now, we will learn about gravity.",
    "In this level you will have to use the yellow powerup to reverse the world gravity.",
    "Get Zee to the exit before he falls from the cliff!"
]

//Level 3 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
let titleLevel3: String = "Level 3 - Whatever goes around..."
let gtLevel3: [String] = [
    "This time we will understand resolve.",
    "If a basket ball had 100% resolve, it would keep boucing and returning to the same height you dropped it forever.",
    "The purple powerup will let you bounce onto that wall and return with twice as speed as you hit it.",
    "Now get to the exit!"
]

//Level 4 -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
let titleLevel4: String = "Level 4 - I guess it's on you"
let gtLevel4: [String] = [
    "Enough learning!",
    "Show me what you understood and get Zee to the exit!!!"
]

let levelTitles: [String] = [titleLevel1, titleLevel2, titleLevel3, titleLevel4]
