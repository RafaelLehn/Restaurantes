//
//  PerfilViewController.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 26/11/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import Foundation
import UIKit

class PerfilViewController: UIViewController {
    
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    var perfilBackground: UIView!
    var imageMyPhoto: UIImageView!
    var lbMyName: UILabel!
    var lbMyProfession: UILabel!
    var lbGitHubLink: UIButton!
    var imageBackground: UIImageView!
    
    override func viewDidLoad() {
        
        setBackground()
        createViewPerfil()
        setPhotoPerfil()
        setNamePerfil()
        setProfessionPerfil()
        setGitHubLink()
    }
    
    func createViewPerfil(){
        perfilBackground = UIView(frame: CGRect(x: 40, y: statusBarHeight, width: view.frame.width - 80, height: view.frame.height - 100));
        view.addSubview(perfilBackground)
    }
    
    func setBackground(){
        imageBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        imageBackground.image = #imageLiteral(resourceName: "swift-og")
//        imageMyPhoto.alpha = 0.5
        view.addSubview(imageBackground)
    }
    
    func setPhotoPerfil(){
        imageMyPhoto = UIImageView(frame: CGRect(x: perfilBackground.frame.width/2 - 75, y: 30, width: 150, height: 240))
        imageMyPhoto.image = #imageLiteral(resourceName: "myPhoto")
        perfilBackground.addSubview(imageMyPhoto)
    }
    
    func setNamePerfil(){
        lbMyName = UILabel(frame: CGRect(x: 0, y: imageMyPhoto.frame.maxY + 32, width: perfilBackground.frame.width, height: 40))
        lbMyName.text = "Rafael Batista Silva"
        lbMyName.textAlignment = .center
        lbMyName.tintColor = .white
        lbMyName.font = lbMyName.font.withSize(24)
        perfilBackground.addSubview(lbMyName)
    }
    
    func setProfessionPerfil(){
        lbMyProfession = UILabel(frame: CGRect(x: 0, y: lbMyName.frame.maxY + 16, width: perfilBackground.frame.width, height: 40))
        lbMyProfession.text = "Mobile Developer iOS"
        lbMyProfession.textAlignment = .center
        lbMyProfession.tintColor = .white
        lbMyProfession.font = lbMyProfession.font.withSize(24)
        perfilBackground.addSubview(lbMyProfession)
    }
    
    func setGitHubLink(){
        lbGitHubLink = UIButton(frame: CGRect(x: 0, y: perfilBackground.frame.maxY - (tabBarController?.tabBar.frame.size.height)! - 25, width: perfilBackground.frame.width, height: 40))
        lbGitHubLink.setTitle("Click here for access my Github", for: .normal)
        lbGitHubLink.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        perfilBackground.addSubview(lbGitHubLink)
        
    }
    
    
    @objc func buttonLinkedin(sender: UIButton!) {
        if let url = URL(string: "http://www.github.com/rafaellehn") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        if let url = URL(string: "http://www.github.com/rafaellehn") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
}
