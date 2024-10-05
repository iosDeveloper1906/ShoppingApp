//
//  ProductCell.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 04/10/24.
//

import UIKit

class ProductCell: UICollectionViewCell {

 
    
    @IBOutlet weak var cellParentView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var ratingView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
