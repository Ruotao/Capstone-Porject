//
//  ar_ViewController.swift
//  Final_CaptonePorject
//
//  Created by Ruotao Lin on 10/15/20.
//

import UIKit
import RealityKit

class ar_ViewController: UIViewController {

    @IBOutlet weak var flameTest: UIButton!
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var startAR: UIButton!
    var plane: AR.Plane!
    var breaker1: AR.Beaker!
    override func viewDidLoad() {
        super.viewDidLoad()
//        var plane: AR.Plane!
//        var breaker1: AR.Beaker!
        flameTest.alpha = 0
        flameTest.layer.cornerRadius = 12
        
        plane = try! AR.loadPlane()
        breaker1 = try! AR.loadBeaker()
        plane.generateCollisionShapes(recursive: true)
        breaker1.generateCollisionShapes(recursive: true)
        arView.scene.addAnchor(plane)
        arView.scene.addAnchor(breaker1)
        
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func startButton(_ sender: Any) {
        
        startAR.alpha = 0
        flameTest.alpha = 0.6
        plane.notifications.start.post()
        plane.notifications.welcome.post()
        
    }
    @IBAction func flameButton(_ sender: Any) {
        
        plane.notifications.showGreenFire.post()
        plane.notifications.atomShow.post()
        flameTest.alpha = 0
        
        
    }
}
