//
//  ViewController.swift
//  CannonGame
//
//  Created by Simge on 1.07.2021.
//

import UIKit

class GameVC: UIViewController {

    var gameBrain = Brain()
    var nickname: String?
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var cannonImageView: UIImageView!
    
    @IBOutlet weak var firstBottle: UIImageView!
    @IBOutlet weak var secondBottle: UIImageView!
    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBrain.player.nickname = nickname
        
        nicknameLabel.text = "Nickname : \(nickname ?? " ")"
        scoreLabel.text = "Score : \(gameBrain.player.score)"
        
        gameBrain.bottles.append(Bottle(d: 960.0, delta: 0.5, isHorizontal: true))
        gameBrain.bottles.append(Bottle(d: 1000.0, delta: 1.0, isHorizontal: true))
        
        print(gameBrain.bottles)
        
    }
    
    
    @IBAction func speedSlider(_ sender: UISlider) {
        
        gameBrain.cannon.speed = Int(sender.value)
        print(gameBrain.cannon.speed )
    }
    
    
    @IBAction func degreeSlider(_ sender: UISlider) {
        
        gameBrain.cannon.teta = Double(Int(sender.value))
        print(gameBrain.cannon.teta)
        
        cannonImageView.transform = CGAffineTransform(rotationAngle: CGFloat(360 - (sender.value * 2 * .pi / sender.maximumValue / 2)))
        
    }
    
    
    @IBAction func readyButton(_ sender: UIButton) {
        
        let distance = gameBrain.findDistance()
        let result = gameBrain.shot(distance: distance)
        
        for (index,bottle) in gameBrain.bottles.enumerated() {
            
            if bottle.isHorizontal == false {
                
                switch index {
                case 0:
                    firstBottle.image = UIImage(named: "vertical_bottle")
                case 1:
                    secondBottle.image = UIImage(named: "vertical_bottle")
                default:
                    break
                }
        }
        gameBrain.updateScore(isShotted: result)
        scoreLabel.text = "Score : \(gameBrain.player.score)"
        }
    }

}
