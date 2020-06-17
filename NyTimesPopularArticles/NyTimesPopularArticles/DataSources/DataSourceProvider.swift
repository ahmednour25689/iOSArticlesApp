//
//  DataSourceProvider.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import UIKit
public class DataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let dataManager: DataManager
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init()
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataManager.itemsCount ?? 10
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = dataManager.item(at: indexPath.row) as? Results {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let view = appDelegate.window?.rootViewController as? UINavigationController
            view?.pushViewController(NewsDetailsCoordinator.setupModule(serializableObject: item), animated: true)
        }
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostPopularArticleTableViewCell", for: indexPath) as! MostPopularArticleTableViewCell
        if let item = dataManager.item(at: indexPath.row) as? Results {
            cell.hideSkeleton()
            cell.config(newsData: item)
        } else {
            cell.showAnimatedGradientSkeleton()
        }
        return cell
    }
}
