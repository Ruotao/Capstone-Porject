//
//  ViewController.swift
//  Capstone Porject
//
//  Created by Ruotao Lin on 9/26/20.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var detectTextLabel: UITextField!
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detectTextLabel.alpha = 0.7
        detectTextLabel.backgroundColor = .gray
        detectTextLabel.layer.cornerRadius = 30
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = .showFeaturePoints
        
 
    }
    
    //dismiss button----back to main interface
    @IBAction func BackToMainPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        UIView.animate(withDuration: 0.5,
                       animations: {
//                        self.detectTextLabel.text = "Detected plane"
                        self.detectTextLabel.alpha = 0
                       },
                       completion: nil)
        if let placeAchor = anchor as? ARPlaneAnchor{
            let plane = SCNPlane(width: CGFloat(placeAchor.extent.x), height: CGFloat(placeAchor.extent.z))
            guard let material = plane.firstMaterial else{return}
            material.diffuse.contents = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.simdPosition = placeAchor.center
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
            
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: sceneView)else{return}
        guard let result = sceneView.hitTest(location, types: .existingPlaneUsingExtent).first else{return}
        let position = result.worldTransform.columns.3
        
        
        guard let scene = SCNScene(named: "art.scnassets/teapot.scn")else{return}
        guard let teapotNode = scene.rootNode.childNode(withName: "Teapot", recursively: true)else{return}
        teapotNode.position = SCNVector3(position.x, position.y, position.z)
        
        sceneView.scene.rootNode.addChildNode(teapotNode)
    }
    }
    
    
    
    

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

