//
//  GameViewController.swift
//  HitTheTree
//
//  Created by dexunzhu on 2018-06-13.
//  Copyright © 2018 dexunzhu. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    let CategoryTree = 2
    
    var sceneView: SCNView!
    var scene: SCNScene!
    
    var ballNode: SCNNode!
    var selfieStickNode: SCNNode!
    
    var motion = MotionHelper()
    var motionForce = SCNVector3(0, 0, 0)
    
    var sounds:[String: SCNAudioSource] = [:]
    
    override func viewDidLoad() {
        setupScene()
        setupNodes()
        setupSound()
    }
    
    func setupScene()  {
        sceneView = self.view as! SCNView
        sceneView.delegate = self
        
        // sceneView.allowsCameraControl  = true
        scene = SCNScene(named: "art.scnassets/MainScene.scn")
        sceneView.scene = scene
        
        scene.physicsWorld.contactDelegate = self
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        
        tapRecognizer.addTarget(self, action: #selector(GameViewController.sceneViewTapped(recognizer:)))
        sceneView.addGestureRecognizer(tapRecognizer)
        
    }
    
    func setupNodes()  {
        ballNode = scene.rootNode.childNode(withName: "ball", recursively: true)!
        ballNode.physicsBody?.contactTestBitMask = CategoryTree
        selfieStickNode = scene.rootNode.childNode(withName: "selfieStick", recursively: true)!
        
    }
    
    func setupSound() {
        let sawSound = SCNAudioSource(fileNamed: "chainsaw.wav")!
        let jumpSound = SCNAudioSource(fileNamed: "jump.wav")!
        sawSound.load()
        jumpSound.load()
        sawSound.volume = 0.3
        jumpSound.volume = 0.4
        sounds["saw"] = sawSound
        sounds["jump"] = jumpSound
        
        let backgroundMusic = SCNAudioSource(fileNamed: "background.mp3")!
        backgroundMusic.volume = 0.1
        backgroundMusic.loops = true
        backgroundMusic.load()
        
        let musicPlayer = SCNAudioPlayer(source: backgroundMusic)
        ballNode.addAudioPlayer(musicPlayer)
    }
    
    @objc func sceneViewTapped (recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: sceneView)
        
        let hitresult = sceneView.hitTest(location, options: nil)
        
        if hitresult.count > 0 {
            let result = hitresult.first
            if let node = result?.node {
                if node.name == "ball" {
                    let jumpSound =  sounds["jump"]!
                    ballNode.runAction(SCNAction.playAudio(jumpSound, waitForCompletion: false))
                    ballNode.physicsBody?.applyForce(SCNVector3(x: 0, y: 3, z: -2), asImpulse: true)
                }
            }
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}

extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        let ball = ballNode.presentation
        let ballPosition =  ball.position
        
        let targetPosition = SCNVector3(x: ballPosition.x, y: ballPosition.y+5, z: ballPosition.z+5)
        
        var cameraPostion = selfieStickNode.position
        let camDamping: Float = 0.3
        
        let xComponent = cameraPostion.x * (1 - camDamping) + targetPosition.x * camDamping
        let yComponent = cameraPostion.y * (1 - camDamping) + targetPosition.y * camDamping
        let zComponent = cameraPostion.z * (1 - camDamping) + targetPosition.z * camDamping
        
        cameraPostion = SCNVector3(x: xComponent, y: yComponent, z: zComponent)
        selfieStickNode.position = cameraPostion
        
        motion.getAccelerometerData{(x, y, z) in self.motionForce = SCNVector3(x: x * 0.05, y: 0, z: (y + 0.8) * -0.05 )}
        
        ballNode.physicsBody?.velocity += motionForce
    }
}

extension GameViewController: SCNPhysicsContactDelegate {
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        var contactNode: SCNNode!
        
        if contact.nodeA.name == "ball" {
           contactNode = contact.nodeB
        } else {
           contactNode = contact.nodeA
        }
        
        if contactNode.physicsBody?.categoryBitMask == CategoryTree {
            contactNode.isHidden = true
            
            let sawSound =  sounds["saw"]!
            ballNode.runAction(SCNAction.playAudio(sawSound, waitForCompletion: false))
            
            let wait = SCNAction.wait(duration: 15)
            let unhiddenAction = SCNAction.run{(node) in node.isHidden = false}
            
            let actionSequence = SCNAction.sequence([wait, unhiddenAction])
            
            contactNode.runAction(actionSequence)
            
        }
    }
}
