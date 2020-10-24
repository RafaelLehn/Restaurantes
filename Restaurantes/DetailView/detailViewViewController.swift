//
//  detailViewViewController.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 02/10/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import UIKit

class detailViewViewController: UIViewController, URLSessionDelegate {
    
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
    @IBOutlet weak var lbAbout: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    
    public var numberId: Int!
    var arrayss = [String:Any]()
    var keys = [String]()
    
    var Name = String()
    var Category = String()
    var Review = Double()
    var Adress = String()
    var Phone = String()
    var About = String()
    
    @IBOutlet weak var ivReview1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        servico()
        setupReview()
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
                
                self.arrayss = json
                self.keys = Array(json.keys)
                
                self.Name = (json["name"] as! String)
                self.Review = (json["review"] as! Double)
                self.Category = (json["type"] as! String)
                self.Adress = (json["adress"] as! String)
                self.About = (json["about"] as! String)
                self.Phone = (json["phone"] as! String)

                
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
        lbName.text = Name
        lbRating.text = String(Review)
        lbAbout.text = About
        lbTime.text = "legal"
        lbPhone.text = Phone
        
        let newString = Adress.replacingOccurrences(of: ",", with: ", ", options: .literal, range: nil)
        lbLocation.text = newString.replacingOccurrences(of: "Minas Gerais", with: "MG", options: .literal, range: nil)
    }
    
    private func setupReview(){
        ivReview1.layer.borderWidth = 2
        ivReview1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ivReview1.layer.cornerRadius = 25
    }
    
    func setupStars(){
        var ratingNumber = Review
        ratingNumber.round()
        
         if ratingNumber ?? 0.0 < 0.5 {
             // nothing stars
             
         } else if ratingNumber ?? 0.5 < 1.5 {
             
            self.star1.image = #imageLiteral(resourceName: "on")
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
             
             star1.image = #imageLiteral(resourceName: "on")
             star2.image = #imageLiteral(resourceName: "on")
             star3.image = #imageLiteral(resourceName: "on")
             star4.image = #imageLiteral(resourceName: "on")
        
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

