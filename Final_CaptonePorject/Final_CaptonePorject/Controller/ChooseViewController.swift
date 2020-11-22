//
//  ChooseViewController.swift
//  Final_CaptonePorject
//
//  Created by Ruotao Lin on 10/29/20.
//

import UIKit

class ChooseViewController: UIViewController {

    @IBOutlet weak var flametest: UIButton!
    @IBOutlet weak var hottea: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        flametest.layer.cornerRadius = 12
        flametest.alpha = 0.7
        hottea.alpha = 0.7
        hottea.layer.cornerRadius = 12

        // Do any additional setup after loading the view.
    }
    

    @IBAction func HTbutton(_ sender: Any) {
        let ar_teaVC = storyboard?.instantiateViewController(identifier: "hottea") as! HotTeaViewController
        ar_teaVC.modalPresentationStyle = .fullScreen
        present(ar_teaVC, animated: true, completion: nil)
    }
    
    @IBAction func FTbutton(_ sender: Any) {
        let arVC = storyboard!.instantiateViewController(identifier: "arVC") as! ar_ViewController
        arVC.modalPresentationStyle = .fullScreen
        present(arVC, animated: true, completion: nil)
    }
    
}
