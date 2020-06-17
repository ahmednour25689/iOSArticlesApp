//
//  MostPopularArticlesCoordinator.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import UIKit
class MostPopularArticlesCoordinator {
    private weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }

    public static func setupModule() -> UINavigationController {
        let mostPopularVc = MostPopularArticlesViewController(nibName: "MostPopularArticlesViewController", bundle: nil)
        let mostPopularNVC = UINavigationController(rootViewController: mostPopularVc)
        return mostPopularNVC
    }
}
