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
    var lbMyTelephone: UILabel!
    var lbMyEmail: UILabel!
    var btGitHubLink: UIButton!
    var imageBackground: UIImageView!
    var btLinkedinLink: UIButton!
    
    override func viewDidLoad() {
        
        setBackground()
        createViewPerfil()
        setPhotoPerfil()
        setNamePerfil()
        setProfessionPerfil()
        setGitHubLink()
        setLinkedinLink()
        setTelephone()
        setEmail()
        setLogoSwift()
    }
    
    func createViewPerfil(){
        perfilBackground = UIView(frame: CGRect(x: 40, y: statusBarHeight, width: view.frame.width - 80, height: view.frame.height - 100));
        view.addSubview(perfilBackground)
    }
    
    func setBackground(){
        let gradient = CAGradientLayer()
        let firstColor = #colorLiteral(red: 0.9815891385, green: 0.6906915307, blue: 0.2467031479, alpha: 1)
        let secondColor = #colorLiteral(red: 1, green: 0.2072572708, blue: 0.1528325379, alpha: 1)
        gradient.frame = view.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]

        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func setPhotoPerfil(){
        imageMyPhoto = UIImageView(frame: CGRect(x: perfilBackground.frame.width/2 - 120, y: 30, width: 240, height: 240))
        imageMyPhoto.image = #imageLiteral(resourceName: "myPhoto")
        perfilBackground.addSubview(imageMyPhoto)
    }
    
    func setNamePerfil(){
        lbMyName = UILabel(frame: CGRect(x: 0, y: imageMyPhoto.frame.maxY + 32, width: perfilBackground.frame.width, height: 40))
        lbMyName.text = "Rafael Batista Silva"
        lbMyName.textAlignment = .center
        lbMyName.textColor = .white
        lbMyName.font = lbMyName.font.withSize(24)
        perfilBackground.addSubview(lbMyName)
    }
    
    func setProfessionPerfil(){
        lbMyProfession = UILabel(frame: CGRect(x: 0, y: lbMyName.frame.maxY + 16, width: perfilBackground.frame.width, height: 40))
        lbMyProfession.text = "Mobile Developer iOS"
        lbMyProfession.textAlignment = .center
        lbMyProfession.textColor = .white
        lbMyProfession.font = lbMyProfession.font.withSize(24)
        perfilBackground.addSubview(lbMyProfession)
    }
    
    func setTelephone(){
        lbMyTelephone = UILabel(frame: CGRect(x: 0, y: lbMyProfession.frame.maxY + 16, width: perfilBackground.frame.width, height: 40))
        lbMyTelephone.text = "+55 11 95890-3393"
        lbMyTelephone.textAlignment = .center
        lbMyTelephone.textColor = .white
        lbMyTelephone.font = lbMyProfession.font.withSize(24)
        perfilBackground.addSubview(lbMyTelephone)
    }
    
    func setEmail(){
        lbMyEmail = UILabel(frame: CGRect(x: 0, y: lbMyTelephone.frame.maxY + 16, width: perfilBackground.frame.width, height: 40))
        lbMyEmail.text = "rafaellehn0@hotmail.com"
        lbMyEmail.textAlignment = .center
        lbMyEmail.textColor = .white
        lbMyEmail.font = lbMyProfession.font.withSize(24)
        perfilBackground.addSubview(lbMyEmail)
    }
    
    func setLogoSwift(){
        imageBackground = UIImageView(frame: CGRect(x: view.center.x - 100, y: lbMyEmail.frame.maxY + 32, width: 100, height:100))
        imageBackground.image = #imageLiteral(resourceName: "swift-og")
        perfilBackground.addSubview(imageBackground)
    }
    
    func setGitHubLink(){
        btGitHubLink = UIButton(frame: CGRect(x: 0, y: perfilBackground.frame.maxY - (tabBarController?.tabBar.frame.size.height)! - 25, width: perfilBackground.frame.width, height: 40))
        btGitHubLink.setTitle("Click here for access my Linkedin", for: .normal)
        btGitHubLink.addTarget(self, action: #selector(buttonLinkedin), for: .touchUpInside)
        btGitHubLink.titleLabel?.font = btGitHubLink.titleLabel?.font.withSize(22)
        perfilBackground.addSubview(btGitHubLink)
        
    }
    
    func setLinkedinLink(){
        btLinkedinLink = UIButton(frame: CGRect(x: 0, y: btGitHubLink.frame.minY - 40, width: perfilBackground.frame.width, height: 40))
        btLinkedinLink.setTitle("Click here for access my Github", for: .normal)
        btLinkedinLink.addTarget(self, action: #selector(buttonGithub), for: .touchUpInside)
        btLinkedinLink.titleLabel?.font = btLinkedinLink.titleLabel?.font.withSize(22)
        perfilBackground.addSubview(btLinkedinLink)
        
    }
    
    
    @objc func buttonLinkedin(sender: UIButton!) {
        if let url = URL(string: "https://www.linkedin.com/in/rafael-batista-silva-211362131/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @objc func buttonGithub(sender: UIButton!) {
        if let url = URL(string: "http://www.github.com/rafaellehn") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
}
