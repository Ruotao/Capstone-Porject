//
//  MainViewController.swift
//  Final_CaptonePorject
//
//  Created by Ruotao Lin on 10/15/20.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = startButton.frame.width / 2
        startButton.clipsToBounds = true
        self.view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ARButton(_ sender: Any) {
//        let arVC = storyboard!.instantiateViewController(identifier: "arVC") as! ar_ViewController
//        arVC.modalPresentationStyle = .fullScreen
//        present(arVC, animated: true, completion: nil)
        let chooseVC = storyboard!.instantiateViewController(identifier: "chooseVC") as! ChooseViewController
        chooseVC.modalPresentationStyle = .fullScreen
        present(chooseVC, animated: true, completion: nil)
    }
    
//    @IBAction func AR_TEAButton(_ sender: Any) {
//        let ar_teaVC = storyboard?.instantiateViewController(identifier: "hottea") as! HotTeaViewController
//        ar_teaVC.modalPresentationStyle = .fullScreen
//        present(ar_teaVC, animated: true, completion: nil)
//    }
    
//    @IBAction func AR_HotteaButton(_ sender: Any) {
//        let ar_teaVC = storyboard?.instantiateViewController(identifier: "hottea") as! HotTeaViewController
//        ar_teaVC.modalPresentationStyle = .fullScreen
//        present(ar_teaVC, animated: true, completion: nil)
//    }
}
