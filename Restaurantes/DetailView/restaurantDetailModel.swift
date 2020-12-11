//
//  restaurantDetailModel.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 11/12/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import Foundation
import UIKit

class restaurantDetailModel {
    var otherList: Array<String> = ["Coworking", "Restaurante", "Padaria", "Sucos Naturais", "Cafeteria", "Barbearia", "Bares", "Supermercado", "produtos naturais"]
    
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
            
        case "Produtos naturais":
            return UIImage(named: otherList[8])!
            
        default:
            return UIImage(named: otherList[1])!
        }
    }
}
