//
//  MostPopularArticlesViewModel.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import NetworkLayer

struct ApiUrlComponent {
  let baseurl: String
  let apiPath: String
  let params: [String: String]
}
class MostPopularArticlesViewModel: ViewModelProtocol {
  var viewtitle: String {
    return Constants.mostPopularviewTitle
  }
  var tableRowEstimatedHeight: Double {
    return Constants.estimatedTableRowHeight
  }
  weak var viewModelViewDelegate: ViewModelViewProtocol?
  init(delegate: ViewModelViewProtocol) {
    self.viewModelViewDelegate = delegate
  }
  func getData(with urlComponts: ApiUrlComponent) {
    let manger = NetworkMangerInterface<BaseResponse>.createNetworkMangerInstance(baseUrl: urlComponts.baseurl, path: urlComponts.apiPath, params: urlComponts.params)
         manger.getData {[weak self] result in
             switch result {
             case let .success(data):
              self?.viewModelViewDelegate?.didGetDataWithSuccess(data: data.results)
             case let .failure(error):
              let errorModel = ErrorModel(id: 0, localizedDescription: error.localizedDescription)
                 self?.viewModelViewDelegate?.didFailedWithError(error: errorModel)
             }
         }
     }
}
