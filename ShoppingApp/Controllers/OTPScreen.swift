//
//  OTPScreen.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 28/09/24.
//

import UIKit
import RealmSwift

class OTPScreen: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var otpTVOne: UITextField!
    @IBOutlet weak var otpTVTwo: UITextField!
    @IBOutlet weak var otpTVThree: UITextField!
    @IBOutlet weak var otpTVFour: UITextField!
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()


    
    }
    
  
    
    @IBAction func verifyOTP(_ sender: UIButton) {
        getUserData()
        
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let currentText = (textField.text ?? "") as NSString
        let newText = currentText.replacingCharacters(in: range, with: string)
        
        if newText.count > 1 {
            return false
        }
        
        if newText.count == 1 {
            DispatchQueue.main.async {
                if textField == self.otpTVOne {
                    self.otpTVTwo.becomeFirstResponder()
                } else if textField == self.otpTVTwo {
                    self.otpTVThree.becomeFirstResponder()
                } else if textField == self.otpTVThree {
                    self.otpTVFour.becomeFirstResponder()
                }
            }
            
        }
        
        print(newText)
        if string.isEmpty && range.length == 1 {
                   // Backspace action
                   if textField.text?.count == 1 {
                       if textField == otpTVFour {
                           otpTVFour.text = ""
                           DispatchQueue.main.async {
                               self.otpTVThree.becomeFirstResponder()
                           }
                            // Move to textField1
                       } else if textField == otpTVThree {
                           otpTVThree.text = ""
                           DispatchQueue.main.async {
                               self.otpTVTwo.becomeFirstResponder()
                           } // Move to textField2
                       } else if textField == otpTVTwo {
                           otpTVTwo.text = ""
                           DispatchQueue.main.async {
                               self.otpTVOne.becomeFirstResponder()
                           } // Move to textField2
                       }else if textField == otpTVOne {
                           otpTVOne.text = ""
                           DispatchQueue.main.async {
                               self.otpTVOne.resignFirstResponder()
                           } // Move to textField2
                       }
                       
                   }
               }
                          
    
        return true
    }
    

    func getUserData(){
        let userDetails = realm.objects(LoginModel.self)
        debugPrint(userDetails.count)
        if userDetails.count != 0{
            for user in userDetails {
                if UserDefaults.standard.string(forKey: Constant.MobileNumber) == user.mobileNumber {
                     let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                     let newvc = storyBoard.instantiateViewController(withIdentifier: Constant.DasboardScreen)
                    
                    self.navigationController?.pushViewController(newvc, animated: true)
            

                }else {
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let newvc = storyBoard.instantiateViewController(withIdentifier: Constant.UserDetailScreen)
                    
                    self.navigationController?.pushViewController(newvc, animated: true)
                    

                }
            }
        }else{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let newvc = storyBoard.instantiateViewController(withIdentifier: Constant.UserDetailScreen)
            
            self.navigationController?.pushViewController(newvc, animated: true)
        }
        
    }

}
