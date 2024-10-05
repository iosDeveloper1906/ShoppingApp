//
//  ImageView.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 05/10/24.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
    
    func setImageURL(urlString: String) {
        
        guard let url = URL.init(string: urlString) else {
            return
        }

        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
