//
//  detailViewViewController.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 02/10/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import UIKit

class detailViewViewController: UIViewController, URLSessionDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var panGestureRecognizer: UIPanGestureRecognizer?
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var imvRestaurant: UIImageView!
    @IBOutlet weak var sharedButton: UIButton!
    @IBOutlet weak var lbAbout: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var collectionImages: UICollectionView!
    var Location: String!
    
    public var numberId: Int!
    var restaurantDetail = RestaurantDetailModel(Name: "", Category: "", Review: 0.0, Adress: "", Phone: "", About: "")
    public var bacana = UIImage()
    
    @IBOutlet weak var ivReview1: UIView!
    @IBOutlet weak var ivReview2: UIView!
    @IBOutlet weak var ivReview3: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionImages.delegate = self
        collectionImages.dataSource = self
        
        sharedButton.isEnabled = false
        collectionImages.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "restaurantCell")
        servico()
        setupReview()
        setupImage()
    }
    
    private func servico(){
        //create the url with NSURL
        let url = URL(string: "https://hotmart-mobile-app.herokuapp.com/locations/\(numberId!)")! //change the url
        //create the session object
        let configuration = URLSessionConfiguration.default
        let operation = OperationQueue()
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: operation)

        //now create the URLRequest object using the url object
        let request = URLRequest(url: url)

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

            guard error == nil else {
                return
            }

            guard let data = data else {
                return
            }
            
           do {
              //create json object from data\
              if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                 print(json)
                self.restaurantDetail.Name = (json["name"] as! String)
                self.restaurantDetail.Review = (json["review"] as! Double)
                self.restaurantDetail.Category = (json["type"] as! String)
                self.restaurantDetail.Adress = (json["adress"] as! String)
                self.restaurantDetail.About = (json["about"] as! String)
                self.restaurantDetail.Phone = (json["phone"] as! String)
              }
            DispatchQueue.main.async {
                self.setupStars()
                self.setupInfo()
            }
           } catch let error {
                print(error.localizedDescription)
           }
        })
        task.resume()
    }
    
    private func setupInfo() {
        lbName.text = restaurantDetail.Name
        lbRating.text = String(restaurantDetail.Review)
        lbAbout.text = restaurantDetail.About
        lbTime.text = "legal"
        lbPhone.text = restaurantDetail.Phone
        
        Location = restaurantDetail.Adress.replacingOccurrences(of: ",", with: ", ", options: .literal, range: nil)
        lbLocation.text = Location.replacingOccurrences(of: "Minas Gerais", with: "MG", options: .literal, range: nil)
        sharedButton.isEnabled = true
    }
    
    private func setupReview(){
        ivReview1.layer.borderWidth = 2
        ivReview1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ivReview1.layer.cornerRadius = 25
        
        
        ivReview2.layer.borderWidth = 2
        ivReview2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ivReview2.layer.cornerRadius = 25
        
        
        ivReview3.layer.borderWidth = 2
        ivReview3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ivReview3.layer.cornerRadius = 25
    }
    
    func setupStars(){
        var ratingNumber = restaurantDetail.Review
        ratingNumber.round()
        displayStar(number: ratingNumber)
    }
    
    func displayStar(number: Double){
        
        if number < 0.5 {
             
             star1.image = #imageLiteral(resourceName: "off")
             star2.image = #imageLiteral(resourceName: "off")
             star3.image = #imageLiteral(resourceName: "off")
             star4.image = #imageLiteral(resourceName: "off")
             star5.image = #imageLiteral(resourceName: "off")
             
         } else if number < 1.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "off")
             star3.image = #imageLiteral(resourceName: "off")
             star4.image = #imageLiteral(resourceName: "off")
             star5.image = #imageLiteral(resourceName: "off")
            
         } else if number < 2.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "off")
             star4.image = #imageLiteral(resourceName: "off")
             star5.image = #imageLiteral(resourceName: "off")
            
        } else if number < 3.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "on")
             star4.image = #imageLiteral(resourceName: "off")
             star5.image = #imageLiteral(resourceName: "off")
            
         } else if number < 4.5 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "on")
             star4.image = #imageLiteral(resourceName: "on")
             star5.image = #imageLiteral(resourceName: "off")
        
         } else if number < 5.1 {
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "on")
             star4.image = #imageLiteral(resourceName: "on")
             star5.image = #imageLiteral(resourceName: "on")
             
         }
    }
    
    func setupImage(){
        imvRestaurant.image = bacana
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionImages.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath) 
        return cell
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareAction(_ sender: Any) {
        let text = "Restaurante - \(restaurantDetail.Name)    \nLocalização - \(Location!)     \nTelefone - \(restaurantDetail.Phone)     \nHorarios - "

        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

}

