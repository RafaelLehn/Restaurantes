//
//  CustomTabBar.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 17/10/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import Foundation
import UIKit

class CustomTabBar: UITabBarController, UITabBarControllerDelegate {
    
    var line : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.isTranslucent = false
        self.view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        setupView()
    }
    
    override var selectedViewController: UIViewController? {
        didSet {
            if let idx = getIndex(vc: selectedViewController){
                UIView.animate(withDuration: 0.4) {
                    self.line.frame = self.getFrame(idx)
                }
            }
        }
    }
    
    private func setupView(){
        line = UIView(frame: getFrame(0))
        line.backgroundColor = UIColor(red: 20/255, green: 173/255, blue: 184/255, alpha: 1)
        self.tabBar.addSubview(line)
    }
    
    private func getIndex(vc:UIViewController?) -> Int? {
        return self.viewControllers?.firstIndex(where: {$0 == vc})
    }
    
    private func getFrame(_ idx: Int) -> CGRect {
        let width = self.view.bounds.width/3
        var x = idx == 0 ? 0 : width
        
        if idx == 2 {
            x = width*2
        }
        
        return CGRect(x: x, y: 0, width: width, height: 2)
    }
}

