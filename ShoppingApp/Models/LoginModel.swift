//
//  LoginModel.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 29/09/24.
//

import Foundation
import RealmSwift


//object defines the realm data class
class LoginModel : Object {
    //dynamic is use to observe the change value in the run time
    @objc dynamic var mobileNumber : String = ""
    @objc dynamic var userName : String = ""
    @objc dynamic var pinCode : String = ""
    @objc dynamic var address : String = ""
   

    
}
