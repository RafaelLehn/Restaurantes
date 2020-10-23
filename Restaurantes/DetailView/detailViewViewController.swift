//
//  detailViewViewController.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 02/10/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import UIKit
public protocol backDetailView: class {
    func back()
}

class detailViewViewController: UIViewController, backDetailView {
    
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStars()
    }
    
    func setupStars(){
        let ratingNumber = Double("3.5")
        
         if ratingNumber ?? 0.0 < 0.5 {
             // nothing stars
             
         } else if ratingNumber ?? 0.5 < 1.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
         }
         
         else if ratingNumber ?? 1.5 < 2.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
         }
         
         else if ratingNumber ?? 2.5 < 3.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "on")
         }
         
         else if ratingNumber ?? 3.5 < 4.5 {
             
//             star1.image = #imageLiteral(resourceName: "on")
//             star2.image = #imageLiteral(resourceName: "on")
//             star3.image = #imageLiteral(resourceName: "on")
//             star4.image = #imageLiteral(resourceName: "on")
        
         } else if ratingNumber ?? 4.5 < 5.1 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "on")
             star4.image = #imageLiteral(resourceName: "on")
             star5.image = #imageLiteral(resourceName: "on")
             
         }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

