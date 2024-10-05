//
//  DashboardScreen.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 02/10/24.
//

import UIKit

class DashboardScreen: UIViewController {
    
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var whishListImg: UIImageView!
    @IBOutlet weak var bagImg: UIImageView!
    
    var productData : [ProductData]?
    
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)

        searchTextField.layer.cornerRadius = 16
        searchTextField.clipsToBounds = true
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchTextField.layer.borderWidth = 2
        
        searchTextField.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: "magnifyingglass")
        imageView.tintColor = UIColor.gray
        searchTextField.rightView = imageView
        
        productCollectionView.register(UINib(nibName: Constant.ProductCell, bundle: nil), forCellWithReuseIdentifier: Constant.ProductCell)
        
        getAllProduct()

       
    }
    
    
    func getAllProduct(){
        APIManager.shared.getProductDetail(responseModel: [ProductData].self) { respose in
            
            switch respose {
                
            case .success(let responseData):
                self.productData = responseData
                
                DispatchQueue.main.async {
                    self.productCollectionView.reloadData()
                }
                
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}

extension DashboardScreen : UICollectionViewDelegate, UICollectionViewDataSource 
,UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.ProductCell, for: indexPath) as! ProductCell
        
        cell.productName.text = productData?[indexPath.row].title ?? ""
        cell.productImage.setImageURL(urlString: productData?[indexPath.row].image ?? "")
        cell.countLabel.text = String(productData?[indexPath.row].rating?.count ?? 0)
        cell.ratingLabel.text = String(format: "%.2f", productData?[indexPath.row].rating?.rate ?? 0.0)
        cell.priceLabel.text = "₹\(String(format: "%.2f", productData?[indexPath.row].price ?? 0.0))"
        
        
        
        cell.cellParentView.layer.cornerRadius = 16
        cell.cellParentView.clipsToBounds = true
        cell.cellParentView.layer.borderWidth = 2
        cell.cellParentView.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ( collectionView.frame.width - 10 ) / 2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBoard.instantiateViewController(identifier: Constant.ProductDetailScreen) as! ProductDetailScreen
        newVC.productData = productData?[indexPath.row]
        self.navigationController?.pushViewController(newVC, animated: true)
        
        
    }
    
    
    
    
}
