//
//  CustomCollectionView.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 18/10/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imvRestaurant: UIImageView!
    @IBOutlet weak var lbNameRestaurant: UILabel!
    @IBOutlet weak var lbTypeRestaurant: UILabel!
    @IBOutlet weak var lbRatingRestaurant: UILabel!
    @IBOutlet weak var constraintHeightImvRestaurant: NSLayoutConstraint!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
