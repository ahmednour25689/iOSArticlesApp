//
//  NewsDetailsCoordinator.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import UIKit
class NewsDetailsCoordinator {
    private weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    public static func setupView(serializableObject: Serializable) -> NewsDetailsViewController {
        let detailsVc = NewsDetailsViewController(data: serializableObject)

        return detailsVc
    }
}
