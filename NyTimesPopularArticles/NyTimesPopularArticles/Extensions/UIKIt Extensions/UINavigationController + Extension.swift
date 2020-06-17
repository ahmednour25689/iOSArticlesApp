//
//  UINavigationController + Extension.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//


import Foundation
import UIKit
 extension UINavigationController {
   

    
    
    func setNavigaionAttributes() {
        
            navigationBar.barTintColor = UIColor(named: "navigaionColor")
            navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationBar.shadowImage = UIImage()
        

        let backImage = UIImage(named: "backIcon")

        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        navigationBar.isTranslucent = false
    }
}
