//
//  DataSourceProvider.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import UIKit
final class TableDataSourceProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let dataManager: DataManager
    private weak var apiCaller: ApiCalling?
    
    init(dataManager: DataManager, apiCaller: ApiCalling) {
        self.dataManager = dataManager
        self.apiCaller = apiCaller
        super.init()
    }
  internal func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return dataManager.itemsCount ?? 10
    }
  internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let item = dataManager.item(at: indexPath.row)
     let cellType = returnCellTypeForAppropriateRow(index: indexPath.row, data: item)
    switch cellType {
    case .news, .loading:
      return UITableView.automaticDimension
    case .error :
      return tableView.frame.height
    }
  }
  internal  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = dataManager.item(at: indexPath.row) as? Results {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let view = appDelegate?.window?.rootViewController as? UINavigationController
            view?.pushViewController(NewsDetailsCoordinator.setupView(serializableObject: item), animated: true)
        }
    }
  internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BaseTableViewCell?
        let item = dataManager.item(at: indexPath.row)
        let cellType = returnCellTypeForAppropriateRow(index: indexPath.row, data: item)
        switch cellType {
        case .news:
          cell = tableView.dequeueReusableCell(withIdentifier: Constants.mostPopularCelldentifier, for: indexPath)
              as? BaseTableViewCell
            cell?.hideSkeleton()
            (cell as? MostPopularArticleTableCell)?.config(newsData: item as? Results)
        case .loading :
            cell = tableView.dequeueReusableCell(withIdentifier: Constants.mostPopularCelldentifier, for: indexPath) as? BaseTableViewCell
            cell?.showGradientSkeleton()
        case .error :
             cell = tableView.dequeueReusableCell(withIdentifier: Constants.networkErrorCelldentifier, for: indexPath) as? BaseTableViewCell
             (cell as? NetworkErrorTableViewCell)?.delegate = self
        }
        return cell!
    }
   private func returnCellTypeForAppropriateRow(index: Int, data: Serializable?) -> CellType {
    if  (data as? Results) != nil {
            return .news
        } else if (data as? ErrorModel) != nil {
            return .error
        } else {
            return .loading
        }
    }
}
extension TableDataSourceProvider: NetworkRetrying {
  func didPressRetry() {
    apiCaller?.callApi()
  }
}
