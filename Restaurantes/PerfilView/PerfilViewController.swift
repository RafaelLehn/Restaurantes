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
    
    override func viewDidLoad() {
        let item: UIView! = UIView(frame: CGRect(x: 0, y: statusBarHeight, width: view.frame.width - 100, height: view.frame.height - 100));
        item.backgroundColor = .white
        view.addSubview(item)
        
        let button: UIButton! = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
        button.setTitle("Perfil", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        item.addSubview(button)
        
        let button2: UIButton! = UIButton(frame: CGRect(x: 200, y: button.frame.size.height, width: 30, height: 30))
        button2.setTitle("Legal", for: .normal)
        button2.backgroundColor = .black
        button2.tintColor = .white
        item.addSubview(button2)
    }
    
    
    
    
}
