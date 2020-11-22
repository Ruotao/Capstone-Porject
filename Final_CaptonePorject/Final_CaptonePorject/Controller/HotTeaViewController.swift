//
//  HotTeaViewController.swift
//  Final_CaptonePorject
//
//  Created by Ruotao Lin on 10/19/20.
//

import UIKit
import RealityKit

class HotTeaViewController: UIViewController {

    @IBOutlet weak var arView: ARView!
    var object: HotTea.HotTea1!
    override func viewDidLoad() {
        super.viewDidLoad()
        object = try! HotTea.loadHotTea1()
        
        arView.scene.addAnchor(object)

        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
