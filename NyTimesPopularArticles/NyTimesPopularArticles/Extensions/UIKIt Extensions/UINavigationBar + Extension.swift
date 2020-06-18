//
//  UINavigationBar + Extension.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//
import Foundation
import UIKit
extension UINavigationBar {
    func setNavigaionBarColor() {
        barTintColor = UIColor(named: "navigaionColor")
        setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        shadowImage = UIImage()
        isTranslucent = false
    }
}
