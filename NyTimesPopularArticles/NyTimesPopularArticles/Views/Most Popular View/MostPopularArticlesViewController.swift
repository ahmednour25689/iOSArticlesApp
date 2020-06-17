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
final class MostPopularArticlesViewController: UIViewController ,ApiCalling{
    @IBOutlet var tableView: UITableView!
    private var dataManager: DataManager?
    private var dataSourceProvider: DataSourceProvider?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 150
        title = "NY Times Most Popular"
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigaionAttributes()
        registerNib()

        callApi()
    }

    func callApi() {
      configureTableViewDataSource(items: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.getData()
        }
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

    func getData() {
        let manger = NetworkMangerInterface<BaseResponse>.createNetworkMangerInstance(baseUrl: "api.nytimes.com", path: "/svc/mostpopular/v2/viewed/1.json", params: ["api-key": "jCMYgbYCbRPGDwkDKjb9Avhj41E1MVGn"])
        manger.getData { result in
            switch result {
            case let .success(data):
                self.configureTableViewDataSource(items: data.results)
            case let .failure(error):
                let errorModel = ErrorModel(id: 0)
                self.configureTableViewDataSource(items: [errorModel])
            }
        }
    }
}
