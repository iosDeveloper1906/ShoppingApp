//
//  ProductResponseModel.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 04/10/24.
//

import Foundation


struct ProductData : Codable {
    
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let rating: RatingData?
}

struct RatingData : Codable{
    let rate: Double?
    let count: Int?
}
