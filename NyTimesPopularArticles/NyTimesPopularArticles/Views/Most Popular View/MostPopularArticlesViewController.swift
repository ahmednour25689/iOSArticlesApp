//
//  MostPopularArticlesViewController.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import NetworkLayer
import UIKit
final class MostPopularArticlesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var dataManager: DataManager?
    private var dataSourceProvider: TableDataSourceProvider?
  private var viewModel: ViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
      setAccessibilityIdentifier()
      initializeViewModel()
      setNavigationBarProperities()
      setUpTableView()
      callApi()
    }
  private func setAccessibilityIdentifier () {
    view.accessibilityIdentifier = "MostPopularView"
  }
  private func setNavigationBarProperities() {
    title = viewModel?.viewtitle
    self.navigationController?.navigationBar.setNavigaionBarColor()
  }
  private func initializeViewModel() {
    viewModel = MostPopularArticlesViewModel(delegate: self)
  }
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
   private func setUpTableView() {
      tableView.estimatedRowHeight = CGFloat(viewModel?.tableRowEstimatedHeight ?? 0)
        tableView.register(UINib(nibName: Constants.mostPopularCelldentifier, bundle: nil), forCellReuseIdentifier: Constants.mostPopularCelldentifier)
        tableView.register(UINib(nibName: Constants.networkErrorCelldentifier, bundle: nil), forCellReuseIdentifier: Constants.networkErrorCelldentifier)
    }
  private  func configureTableViewDataSource(items: [Serializable]?) {
        dataManager = DataManager(dataItems: items)
      dataSourceProvider = TableDataSourceProvider(dataManager: dataManager!, apiCaller: self)
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSourceProvider
            self.tableView.delegate = self.dataSourceProvider
            self.tableView.reloadData()
        }
    }
}
extension MostPopularArticlesViewController: ApiCalling {
  func callApi() {
    configureTableViewDataSource(items: nil)
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        let baseUrl = NetworkConstants.apiBaseUrl
        let apiPath = NetworkConstants.getNewsPath
        let parametes = ["api-key": Constants.apiKey]
        let  apiComponent = ApiUrlComponent(baseurl: baseUrl, apiPath: apiPath, params: parametes)
        self.viewModel?.getData(with: apiComponent)
      }
  }
}
extension  MostPopularArticlesViewController: ViewModelViewProtocol {
  func didGetDataWithSuccess(data: [Serializable]?) {
    self.configureTableViewDataSource(items: data)

  }
  func didFailedWithError(error: Serializable) {
    self.configureTableViewDataSource(items: [error])
  }
}
