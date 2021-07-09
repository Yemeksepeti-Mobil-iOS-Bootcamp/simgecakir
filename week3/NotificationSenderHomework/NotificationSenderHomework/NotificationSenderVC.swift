//
//  ViewController.swift
//  NotificationSenderHomework
//
//  Created by Simge on 8.07.2021.
//

import UIKit

class NotificationSenderVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    var userInfo = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        
        userInfo["name"] = nameTextField.text ?? ""
        
        NotificationCenter.default.post(name: .sendDataNotification, object: nil, userInfo: userInfo)
        dismiss(animated: true, completion: nil)
    }
    
}

