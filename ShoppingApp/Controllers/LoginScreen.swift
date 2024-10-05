//
//  LoginScreen.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 25/09/24.
//

import UIKit
import RealmSwift

class LoginScreen: UIViewController {

    @IBOutlet weak var mobileNumberTV: UITextField!
    let realm = try! Realm()

    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        UserDefaults.standard.setValue(mobileNumberTV.text, forKey: Constant.MobileNumber)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBoard.instantiateViewController(withIdentifier: Constant.OTPScreen)
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    
    
    
    
}
