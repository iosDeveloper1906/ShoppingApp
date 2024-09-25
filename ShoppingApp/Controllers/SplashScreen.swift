//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Vaibhav Gawde on 25/09/24.
//

import UIKit
import Lottie



class SplashScreen: UIViewController {
    
    private var animationView : LottieAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        animationView = .init(name: "Shopping")
        animationView?.frame = view.bounds
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView?.play()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: Constant.LoginScreenID)
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }


}

