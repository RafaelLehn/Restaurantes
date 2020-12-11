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
    
    var otherList: Array<String> = ["Coworking", "Restaurante", "Padaria", "Sucos Naturais", "Cafeteria", "Barbearia", "Bares", "Supermercado"]
    
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
    
    func randomImage(imageCell: UIImageView, type: String){
        imageCell.image = randomFactImage(type: type)
    }
    
    func randomFactImage(type: String) -> UIImage {
        switch type {
        case "Coworking":
            return UIImage(named: otherList[0])!
            
        case "Restaurante":
            return UIImage(named: otherList[1])!
            
        case "Padaria":
            return UIImage(named: otherList[2])!
            
        case "Sucos Naturais":
            return UIImage(named: otherList[3])!
            
        case "Cafeteria":
            return UIImage(named: otherList[4])!
            
        case "Barbearia":
            return UIImage(named: otherList[5])!
            
        case "Bares":
            return UIImage(named: otherList[6])!
        
        case "Supermercado":
            return UIImage(named: otherList[7])!
            
        default:
            return UIImage(named: otherList[2])!
        }
    }
    
    
}
