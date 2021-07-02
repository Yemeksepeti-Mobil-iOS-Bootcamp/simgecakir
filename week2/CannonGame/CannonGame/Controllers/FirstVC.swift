//
//  FirstVCViewController.swift
//  CannonGame
//
//  Created by Simge on 1.07.2021.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    
    var nickname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func playButton(_ sender: UIButton) {
        
        nickname = nicknameTextField.text
        
        performSegue(withIdentifier: "toGameVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toGameVC" {
            
           let destinationVC = segue.destination as! GameVC
            destinationVC.nickname = nickname
        }
    }

}
