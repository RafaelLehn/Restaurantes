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
    
    var imageList: Array<String> = ["image-1", "image-2", "image-3", "image-4", "image-5"]
    public var orderList = String()
    override func awakeFromNib() {
        super.awakeFromNib()
        randomImage()
    }
    
    func randomImage(){
        imvRestaurant.image = randomFactImage()
    }
    
    func randomFactImage() -> UIImage {
        let unsignedArrayCount = UInt32(imageList.count)
        let unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
        let randomNumber = Int(unsignedRandomNumber)
        orderList.append(imageList[randomNumber])
        return UIImage(named: imageList[randomNumber])!
    }
    
}
