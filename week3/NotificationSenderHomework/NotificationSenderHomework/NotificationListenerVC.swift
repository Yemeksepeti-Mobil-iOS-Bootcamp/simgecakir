//
//  NotificationListenerVC.swift
//  NotificationSenderHomework
//
//  Created by Simge on 8.07.2021.
//

import UIKit

class NotificationListenerVC: UIViewController {

    @IBOutlet weak var listenerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self, selector: #selector(handleData(notification:)), name: .sendDataNotification, object: nil)
    }
    
    @objc func handleData(notification: Notification){
        
        if let name = notification.userInfo?["name"] as? String {
            listenerLabel.text = "Merhaba \(name)"
        }
        
    }
    

}
