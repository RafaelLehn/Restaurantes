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
    var loadview: UIView!
    var scheduleDict: Dictionary<String,Any> = [:]
    var scheduleArray: Array<Any> = []
    let objects = ["image-1", "image-2", "image-3", "image-4", "image-5", "image-1", "image-2", "image-3", "image-4", "image-5"]
    
    public var numberId: Int!
    var restaurantDetail = RestaurantDetailModel(Name: "", Category: "", Review: 0.0, Adress: "", Phone: "", About: "", type: "")
    public var bacana = UIImage()
    let star = SelfStar()
    var perfilBackground: UIView!
    var btCLose: UIButton!
    var photoView: UIImageView!
    
    @IBOutlet weak var ivReview1: UIView!
    @IBOutlet weak var ivReview2: UIView!
    @IBOutlet weak var ivReview3: UIView!
    
    let shape = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sharedButton.isEnabled = false
        self.collectionImages.register(UINib(nibName: "PhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "cellIdentifier")
        collectionImages.delegate = self
        collectionImages.dataSource = self
        
        loadingView()
        servico()
        setupReview()
        setupImage()
    }
    
    private func loadingView(){
        loadview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 600));
        loadview.backgroundColor = .white
        loadview.alpha = 0.8
        view.addSubview(loadview)
        animation()
    }
    
    func animation(){
        let center = loadview.center
        
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
    
    private func servico(){
        animateCircle()
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
                self.restaurantDetail.Name = (json["name"] as! String)
                self.restaurantDetail.Review = (json["review"] as! Double)
                self.restaurantDetail.Category = (json["type"] as! String)
                self.restaurantDetail.Adress = (json["adress"] as! String)
                self.restaurantDetail.About = (json["about"] as! String)
                self.restaurantDetail.Phone = (json["phone"] as! String)
                self.restaurantDetail.type = (json["type"] as! String)
                
                if (self.numberId == 1) {
                    self.scheduleArray = json["schedule"] as! Array<Any>
                } else {
                    self.scheduleDict = json["schedule"] as! Dictionary<String, Any>
                }
                
              }
            DispatchQueue.main.async {
                self.shape.isHidden = true
                self.trackLayer.isHidden = true
                self.setupStars()
                self.setupInfo()
                self.loadview.isHidden = true
            }
           } catch let error {
                print(error.localizedDescription)
           }
        })
        task.resume()
    }
    
    private func setupInfo() {
        star.randomImage(imageCell: imvRestaurant, type: restaurantDetail.type)
        lbName.text = restaurantDetail.Name
        lbRating.text = String(restaurantDetail.Review)
        lbAbout.text = restaurantDetail.About
        lbPhone.text = restaurantDetail.Phone
        
        Location = restaurantDetail.Adress.replacingOccurrences(of: ",", with: ", ", options: .literal, range: nil)
        lbLocation.text = Location.replacingOccurrences(of: "Minas Gerais", with: "MG", options: .literal, range: nil)
        sharedButton.isEnabled = true
        
        if numberId == 1{
            
        } else {

            var stringArray:[String] = []
            for (key, value) in self.scheduleDict{
                print("\(key) and \(value)")
//                stringArray.append(value as! String)
                
            }
            
        }
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
        star.selfNewStar(reviewNote: ratingNumber, firstStar: star1, secondStar: star2, thirdStar: star3, fourtStar: star4, fiveStar: star5)
    }
    
    func setupImage(){
        imvRestaurant.image = bacana
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! PhotoCollectionCell

          //in this example I added a label named "title" into the MyCollectionCell class
        cell.imageCell.image = UIImage(named: self.objects[indexPath.item])
          return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openView()
        openPhoto(imageFromCell: UIImage(named: self.objects[indexPath.item])!)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.buttonClose(_:)))
        perfilBackground.addGestureRecognizer(tap)
        photoView.removeGestureRecognizer(tap)
    }
    
    func openView(){
        perfilBackground = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height));
        perfilBackground.backgroundColor = .gray
        perfilBackground.alpha = 0.7
        view.addSubview(self.perfilBackground)
    }
    
    func openPhoto(imageFromCell: UIImage){
        photoView = UIImageView(frame: CGRect(x: perfilBackground.frame.midX, y: perfilBackground.frame.midY, width: 250, height: 250));
        photoView.center = perfilBackground.center
        photoView.image = imageFromCell
        photoView.layer.borderWidth = 10
        photoView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        photoView.layer.masksToBounds = true
        photoView.layer.cornerRadius = 5
        view.addSubview(photoView)
    }
    
    @objc func buttonClose(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
            self.perfilBackground.alpha = 0
            self.photoView.alpha = 0
        }) { _ in
            self.perfilBackground.removeFromSuperview()
            self.photoView.removeFromSuperview()
        }
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

