//
//  restaurantDetailTypeModel.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 11/12/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import Foundation
import UIKit

class restaurantDetailTypeModel {
    
    let objects = ["image-1", "image-2", "image-3", "image-4", "image-5", "image-1", "image-2", "image-3", "image-4", "image-5"]
    var typeBread = ["bolo-de-milho", "pao-australiano", "pao-baguete", "pao-caseiro", "pao-croissant", "pao-de-queijo", "pao-frances", "pao-sonho"]
    var typeRestaurant = ["almondegas", "camarao", "costela", "feijoada", "lasanha", "macarrao", "parmegiana", "picanha"]
    var typeJuice = ["sucos", "maracuja", "laranja", "goiaba", "beterraba", "limao", "morango"]
    var typeBar = ["gyn", "redlabel", "whisky", "caipirinha", "martini"]
    var typeCoffeShop = ["cafe", "latte", "milkbanana", "milkshake", "cappuccino"]
    var typeOrganic = ["organicos-1", "organicos-2", "organicos-3", "organicos-4", "organicos-5"]
    var typeBarber = ["barber-1", "barber-2", "barber-3", "barber-4", "barber-5"]
    var typeCoworking = ["cowo-1", "cowo-2", "cowo-3", "cowo-4", "cowo-5"]
    var typeMarket = ["mercado-1", "mercado-2", "mercado-3", "mercado-4", "mercado-5"]
    
    var perfilBackground: UIView!
    var photoView: UIImageView!
    
    func photoCount(type:String) -> Int {
        switch type {
        case "Coworking":
            typeCoworking.shuffle()
            return typeCoworking.count
            
        case "Padaria":
            typeBread.shuffle()
            return typeBread.count
            
        case "Restaurante":
            typeRestaurant.shuffle()
            return typeRestaurant.count
            
        case "Sucos Naturais":
            typeJuice.shuffle()
            return typeJuice.count
            
        case "Bares":
            typeBar.shuffle()
            return typeBar.count
            
        case "Cafeteria":
            typeCoffeShop.shuffle()
            return typeCoffeShop.count
            
        case "Produtos naturais":
            typeOrganic.shuffle()
            return typeOrganic.count
            
        case "Barbearia":
            typeBarber.shuffle()
            return typeBarber.count
        
        case "Supermercado":
            typeMarket.shuffle()
            return typeMarket.count
            
        default:
            return objects.count
        }
    }
    
    func photoCell(cell: PhotoCollectionCell, type:String, index: IndexPath){
        switch type {
        case "Coworking":
            cell.imageCell.image = UIImage(named: self.typeCoworking[index.item])
            
        case "Padaria":
            cell.imageCell.image = UIImage(named: self.typeBread[index.item])
            
        case "Restaurante":
            cell.imageCell.image = UIImage(named: self.typeRestaurant[index.item])
            
        case "Sucos Naturais":
            cell.imageCell.image = UIImage(named: self.typeJuice[index.item])
            
        case "Bares":
            cell.imageCell.image = UIImage(named: self.typeBar[index.item])
            
        case "Cafeteria":
            cell.imageCell.image = UIImage(named: self.typeCoffeShop[index.item])
        
        case "Produtos naturais":
            cell.imageCell.image = UIImage(named: self.typeOrganic[index.item])
        
        case "Barbearia":
            cell.imageCell.image = UIImage(named: self.typeBarber[index.item])
        
        case "Supermercado":
            cell.imageCell.image = UIImage(named: self.typeMarket[index.item])
        
        default:
            
            cell.imageCell.image = UIImage(named: self.objects[index.item])
        }
    }
    
    func openPhotoType(type:String, index: IndexPath, view: UIView){
        switch type {
        case "Coworking":
            openPhoto(imageFromCell: UIImage(named: self.typeCoworking[index.item])!, view: view)
        
        case "Padaria":
            openPhoto(imageFromCell: UIImage(named: self.typeBread[index.item])!, view: view)
        
        case "Restaurante":
            openPhoto(imageFromCell: UIImage(named: self.typeRestaurant[index.item])!, view: view)
        
        case "Sucos Naturais":
            openPhoto(imageFromCell: UIImage(named: self.typeJuice[index.item])!, view: view)
            
        case "Bares":
            openPhoto(imageFromCell: UIImage(named: self.typeBar[index.item])!, view: view)
        
        case "Cafeteria":
            openPhoto(imageFromCell: UIImage(named: self.typeCoffeShop[index.item])!, view: view)
            
        case "Produtos naturais":
            openPhoto(imageFromCell: UIImage(named: self.typeOrganic[index.item])!, view: view)
        
        case "Barbearia":
            openPhoto(imageFromCell: UIImage(named: self.typeBarber[index.item])!, view: view)
        
        case "Supermercado":
            openPhoto(imageFromCell: UIImage(named: self.typeMarket[index.item])!, view: view)
            

        default:
            
            openPhoto(imageFromCell: UIImage(named: self.objects[index.item])!, view: view)
        }
    }
    
    func openView(view: UIView){
        perfilBackground = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height));
        perfilBackground.backgroundColor = .gray
        perfilBackground.alpha = 0.0
        view.addSubview(self.perfilBackground)
    }
    
    func openPhoto(imageFromCell: UIImage, view: UIView){
        photoView = UIImageView(frame: CGRect(x: perfilBackground.frame.midX, y: perfilBackground.frame.midY, width: 250, height: 250));
        photoView.center = perfilBackground.center
        photoView.image = imageFromCell
        photoView.layer.borderWidth = 10
        photoView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        photoView.layer.masksToBounds = true
        photoView.clipsToBounds = true
        photoView.layer.cornerRadius = 5
        photoView.alpha = 0.0
        view.addSubview(photoView)
        
        addGestureInView()
        fadeIn()
    }
    
    func addGestureInView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.buttonClose(_:)))
        perfilBackground.addGestureRecognizer(tap)
        photoView.removeGestureRecognizer(tap)
    }
    
    @objc func fadeIn(){
        UIView.animate(withDuration: 0.2, delay: 0.5, options: .curveEaseIn, animations: {
            self.perfilBackground.alpha = 0.7
            self.photoView?.alpha = 1.0
        })
    }
    
    
    @objc func buttonClose(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.2, delay: 0.5, options: .curveEaseIn, animations: {
            self.perfilBackground.alpha = 0
            self.photoView.alpha = 0
        }) { _ in
            self.perfilBackground.removeFromSuperview()
            self.photoView.removeFromSuperview()
        }
    }
}
