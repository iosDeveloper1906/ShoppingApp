//
//  UserDetailsScreen.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 29/09/24.
//

import UIKit
import RealmSwift

class UserDetailsScreen: UIViewController {
    
    let realm = try! Realm()

    @IBOutlet weak var firstNameTV: UITextField!
    @IBOutlet weak var pinCodeTV: UITextField!
    @IBOutlet weak var addressTV: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func submitDetails(_ sender: UIButton) {
        addUserDetails()
    }
    
    func addUserDetails() {
        if(validation()){
            let userDetails = LoginModel()
            userDetails.userName = firstNameTV.text ?? ""
            userDetails.mobileNumber = UserDefaults.standard.string(forKey: Constant.MobileNumber) ?? ""
            userDetails.pinCode = pinCodeTV.text ?? ""
            userDetails.address = addressTV.text ?? ""
            
            realm.beginWrite()
            realm.add(userDetails)
            try! realm.commitWrite()
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let newvc = storyBoard.instantiateViewController(withIdentifier: Constant.DasboardScreen)
           
           self.navigationController?.pushViewController(newvc, animated: true)
            
        }
        
    }
    
    func validation() -> Bool {
        
        guard let userName = firstNameTV.text else {
            debugPrint("Enter Name")
            return false
        }
        
        return true
    
        
    }
    
    
   
    
    

    

}
