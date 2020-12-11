//
//  restaurantModel.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 20/11/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import Foundation
import UIKit

struct RestaurantModel {
    let name: String
    let Id: Int
    let Review: Double
    let type: String
}

struct RestaurantDetailModel {
    var Name: String
    var Category: String
    var Review: Double
    var Adress: String
    var Phone: String
    var About: String
    var type: String
}

protocol StarProtocol {
    func selfNewStar(reviewNote: Double, firstStar: UIImageView, secondStar: UIImageView, thirdStar: UIImageView, fourtStar: UIImageView, fiveStar: UIImageView)
}
class SelfStar: StarProtocol {
    
    
    func selfNewStar(reviewNote: Double, firstStar: UIImageView, secondStar: UIImageView, thirdStar: UIImageView, fourtStar: UIImageView, fiveStar: UIImageView) {
        
        if reviewNote < 0.5 {
             
             firstStar.image = #imageLiteral(resourceName: "off")
             secondStar.image = #imageLiteral(resourceName: "off")
             thirdStar.image = #imageLiteral(resourceName: "off")
             fourtStar.image = #imageLiteral(resourceName: "off")
             fiveStar.image = #imageLiteral(resourceName: "off")
             
         } else if reviewNote < 1.5 {
             
             firstStar.image = #imageLiteral(resourceName: "on")
             secondStar.image = #imageLiteral(resourceName: "off")
             thirdStar.image = #imageLiteral(resourceName: "off")
             fourtStar.image = #imageLiteral(resourceName: "off")
             fiveStar.image = #imageLiteral(resourceName: "off")
            
         } else if reviewNote < 2.5 {
             
             firstStar.image = #imageLiteral(resourceName: "on")
             secondStar.image = #imageLiteral(resourceName: "on")
             thirdStar.image = #imageLiteral(resourceName: "off")
             fourtStar.image = #imageLiteral(resourceName: "off")
             fiveStar.image = #imageLiteral(resourceName: "off")
            
        } else if reviewNote < 3.5 {
             
             firstStar.image = #imageLiteral(resourceName: "on")
             secondStar.image = #imageLiteral(resourceName: "on")
             thirdStar.image = #imageLiteral(resourceName: "on")
             fourtStar.image = #imageLiteral(resourceName: "off")
             fiveStar.image = #imageLiteral(resourceName: "off")
            
         } else if reviewNote < 4.5 {
             
             firstStar.image = #imageLiteral(resourceName: "on")
             secondStar.image = #imageLiteral(resourceName: "on")
             thirdStar.image = #imageLiteral(resourceName: "on")
             fourtStar.image = #imageLiteral(resourceName: "on")
             fiveStar.image = #imageLiteral(resourceName: "off")
        
         } else if reviewNote < 5.1 {
             
             firstStar.image = #imageLiteral(resourceName: "on")
             secondStar.image = #imageLiteral(resourceName: "on")
             thirdStar.image = #imageLiteral(resourceName: "on")
             fourtStar.image = #imageLiteral(resourceName: "on")
             fiveStar.image = #imageLiteral(resourceName: "on")
             
         }
    }
}
