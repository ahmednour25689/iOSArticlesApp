//
//  MostPopularArticlesViewController.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import NetworkLayer
import UIKit
protocol ApiCalling : class {
  func callApi()
}
final class MostPopularArticlesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private var dataManager: DataManager?
    private var dataSourceProvider: DataSourceProvider?
  var mostPopularArticlesViewModel: MostPopularArticlesViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 150
        title = "NY Times Most Popular"
        // Do any additional setup after loading the view.
    self.navigationController?.setNavigaionAttributes()
        registerNib()
      initializeViewModel()
        callApi()
    }
  func initializeViewModel(){
    mostPopularArticlesViewModel = MostPopularArticlesViewModel(delegate: self)
  }
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
    func registerNib() {
        tableView.register(UINib(nibName: "MostPopularArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "MostPopularArticleTableViewCell")
        tableView.register(UINib(nibName: "NetworkErrorTableViewCell", bundle: nil), forCellReuseIdentifier: "NetworkErrorTableViewCell")
    }
    func configureTableViewDataSource(items: [Serializable]?) {
        dataManager = DataManager(dataItems: items)
      dataSourceProvider = DataSourceProvider(dataManager: dataManager!, apiCaller: self)
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSourceProvider
            self.tableView.delegate = self.dataSourceProvider
            self.tableView.reloadData()
        }
    }
}
extension MostPopularArticlesViewController : ApiCalling {
  func callApi() {
    configureTableViewDataSource(items: nil)
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        let  apiComponent = ApiUrlComponent(baseurl: NetworkConstants.apiBaseUrl, apiPath: NetworkConstants.getNewsPath, params: ["api-key": Constants.apiKey])
        self.mostPopularArticlesViewModel?.getData(with: apiComponent)
      }
  }
}
extension  MostPopularArticlesViewController : ViewModelViewProtocol {
  func didGetDataWithSuccess(data: [Serializable]?) {
    self.configureTableViewDataSource(items: data)

  }
  func didFailedWithError(error: Serializable) {
    self.configureTableViewDataSource(items: [error])

  }
}
