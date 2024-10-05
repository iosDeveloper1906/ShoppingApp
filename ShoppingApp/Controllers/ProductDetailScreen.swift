//
//  ProductDetailScreen.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 05/10/24.
//

import UIKit

class ProductDetailScreen: UIViewController {

   
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productRating: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var productData : ProductData?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        self.backImg.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backImageTapped(_:)))
        self.backImg.addGestureRecognizer(tapGesture)
        
        setData()

       
    }
    
    
    func setData(){
        productImage.setImageURL(urlString: productData?.image ?? "")
        productName.text = productData?.title
        productDescription.text = productData?.description
        productPrice.text = "₹\(String(format: "%.2f", productData?.price ?? 0.0))"
        productRating.text = String(format: "%.2f", productData?.rating?.rate ?? 0.0)
    }
    
    @IBAction func proceedBtn(_ sender: UIButton) {
        
        
    }
    
    @objc func backImageTapped(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    
   

}
