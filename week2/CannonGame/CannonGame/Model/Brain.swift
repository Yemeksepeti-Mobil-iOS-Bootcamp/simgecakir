//
//  Brain.swift
//  CannonGame
//
//  Created by Simge on 1.07.2021.
//

import Foundation
import UIKit

struct Brain {
    
    var cannon = Cannon()
    var bottles = [Bottle]()
    var player = Player()
    
    let g = 10.0
    
    
    func findDistance() -> Double {
        
        let distance = Double(cannon.speed * cannon.speed) * sin(cannon.teta.degreeToRadian()) / g
        
        return distance
    }
    
    mutating func shot(distance: Double) -> Bool {
        
        var flag = false
        
        for (index,bottle) in bottles.enumerated() {
            
            if bottle.d <= distance && distance <= bottle.d && bottle.isHorizontal == true {
                
                bottles[index].isHorizontal = false
                flag = true
            }
        }
        return flag
    }
        
    mutating func updateScore(isShotted: Bool){
        
        if isShotted{
            player.score += 1
        }

    }
}

extension Double {
    
    func degreeToRadian() -> Double {
        return self * .pi / 180
    }
}
