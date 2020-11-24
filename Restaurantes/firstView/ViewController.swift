//
//  ViewController.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 01/10/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import UIKit
import SystemConfiguration
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITabBarControllerDelegate, URLSessionDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    var arrayss = [String:Any]()
    var keys = [String]()
    let refreshControl = UIRefreshControl()
    let shape = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var restaurant = [RestaurantModel(name: "", Id: 0, Review: 0.0, type: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView?.collectionViewLayout as? CustomCollectionView {
          layout.delegate = self
        }
        self.tabBarController?.delegate = self
        
        collectionView.refreshControl = refreshControl
        self.restaurant.removeAll()
        registryCell()
        animation()
        servico()
    }
    
    func registryCell(){
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "restaurantCell")
    }
    
    // MARK: animations
    
    func animation(){
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 80, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
         
        view.layer.addSublayer(trackLayer)

        shape.path = circularPath.cgPath
        shape.strokeColor = UIColor(red: 20/255, green: 173/255, blue: 184/255, alpha: 1).cgColor
        shape.lineWidth = 10
        shape.fillColor = UIColor.clear.cgColor
        shape.lineCap = .round
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
    }
    
    fileprivate func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shape.add(basicAnimation, forKey: "urSoBasic")
    }
    
    
    func servico(){
        animateCircle()
        //create the url with NSURL
        let url = URL(string: "https://hotmart-mobile-app.herokuapp.com/locations")! //change the url
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
                for value in json.values {
                    if let array = value as? [[String:Any]] {
                        for element in array {
                            if (element["name"] as? String) != nil {
                                self.restaurant.append(RestaurantModel(name: element["name"] as! String,
                                Id: element["id"] as! Int,
                                Review: element["review"] as! Double,
                                type: element["type"] as! String))
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.shape.isHidden = true
                    self.trackLayer.isHidden = true
                }
              }
           } catch let error {
                self.shape.isHidden = true
                self.trackLayer.isHidden = true
                print(error.localizedDescription)
           }
        })
        task.resume()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        _ = tabBarController.selectedIndex
    }
    

    func setupCollection(){
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                let size = CGSize(width:(collectionView!.bounds.width-30)/2, height: 250)
                layout.itemSize = size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurant.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
        cell.contentView.layer.cornerRadius = 15.0
        cell.contentView.layer.borderWidth = 1.0

        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        let restaurantCell = cell as? CustomCollectionViewCell
        let rating = restaurant[indexPath.item].Review
        
        restaurantCell?.lbNameRestaurant.text = restaurant[indexPath.item].name
        restaurantCell?.lbTypeRestaurant.text = restaurant[indexPath.item].type
        restaurantCell?.lbRatingRestaurant.text = String(rating)
        
        let ratingNumber = Double(rating)
        
        newRating(number: ratingNumber, restaurantCell: restaurantCell!)
        
        return cell
    }
    
    func newRating(number: Double, restaurantCell: CustomCollectionViewCell?){
        
        if number < 0.5 {
             
             restaurantCell?.star1.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star2.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star3.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star4.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star5.image = #imageLiteral(resourceName: "off")
             
         } else if number < 1.5 {
             
             restaurantCell?.star1.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star2.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star3.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star4.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star5.image = #imageLiteral(resourceName: "off")
            
         } else if number < 2.5 {
             
             restaurantCell?.star1.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star2.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star3.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star4.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star5.image = #imageLiteral(resourceName: "off")
            
        } else if number < 3.5 {
             
             restaurantCell?.star1.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star2.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star3.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star4.image = #imageLiteral(resourceName: "off")
             restaurantCell?.star5.image = #imageLiteral(resourceName: "off")
            
         } else if number < 4.5 {
             
             restaurantCell?.star1.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star2.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star3.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star4.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star5.image = #imageLiteral(resourceName: "off")
        
         } else if number < 5.1 {
             
             restaurantCell?.star1.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star2.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star3.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star4.image = #imageLiteral(resourceName: "on")
             restaurantCell?.star5.image = #imageLiteral(resourceName: "on")
             
         }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = detailViewViewController()
        
        detailView.numberId = (indexPath.row + 1)
        detailView.modalPresentationStyle = .currentContext
        self.present(detailView, animated: true, completion: nil)
        
    }

}

extension ViewController: CollectionLayoutDelegate {
  func collectionView(
      _ collectionView: UICollectionView,
      heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
    let randomInt = CGFloat.random(in: 218..<296)
    return randomInt
  }
}
