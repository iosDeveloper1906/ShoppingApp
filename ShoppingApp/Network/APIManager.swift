//
//  APIManager.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 04/10/24.
//

import Foundation

enum APIStatus : Error {
    case Success
    case NoData
    case FailResponseCode
    case InvalidURL
    case Failure
}


final class APIManager {
    
    static let shared = APIManager()
    
    private init(){}
    
    func getProductDetail<T: Codable>(responseModel : T.Type, completion : @escaping (Result<T,APIStatus>) -> Void ) {
        
        
        let url = URL(string: "https://fakestoreapi.com/products")
        
        guard let url = url else {
            completion(.failure(.InvalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let responseData = data else {
                completion(.failure(.NoData))
                return
            }
            
            guard let responseCode = response as? HTTPURLResponse,
                  200...299 ~= responseCode.statusCode else {
                completion(.failure(.FailResponseCode))
                return
            }
            
            do {
                
                let responseData = try JSONDecoder().decode(responseModel, from: responseData)
                completion(.success(responseData))
                
                
            }catch{
                completion(.failure(.Failure))
                return
            }
            
            
        }
        
        task.resume()
    }
}
