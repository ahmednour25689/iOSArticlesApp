//
//  DataSourceProvider.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import UIKit
public class DataSourceProvider<T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let dataManager: DataManager<[T]>
    init(dataManager: DataManager<[T]>) {
        self.dataManager = dataManager
        super.init()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.itemsCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MostPopularArticleTableViewCell", for: indexPath) as! MostPopularArticleTableViewCell
        let item = dataManager.item(at: indexPath.row) as! Results
        //cell.config(with: item)
        cell.textLabel?.text = item.title
        return cell
    }
    
    
    
}
