//
//  MainViewController.swift
//  Capstone Porject
//
//  Created by Ruotao Lin on 9/30/20.
//

import UIKit

class MainViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
     

    }
    

    @IBAction func ARShow(_ sender: Any) {
        let ARViewController = storyboard!.instantiateViewController(identifier: "ARController") as! ViewController
        ARViewController.modalPresentationStyle = .fullScreen
        present(ARViewController, animated: true, completion: nil)
    }
    
  
    
        
    


}
