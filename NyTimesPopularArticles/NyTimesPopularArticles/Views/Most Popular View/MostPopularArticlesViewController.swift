//
//  MostPopularArticlesViewController.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import NetworkLayer
import UIKit
class MostPopularArticlesViewController: UIViewController {
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
        configureTableViewDataSource(items: nil)
        callApi()
    }

    func callApi() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.getData()
        }
    }

    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }

    func registerNib() {
        tableView.register(UINib(nibName: "MostPopularArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "MostPopularArticleTableViewCell")
    }

    func configureTableViewDataSource(items: [Serializable]?) {
        dataManager = DataManager(dataItems: items)
        dataSourceProvider = DataSourceProvider(dataManager: dataManager!)
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
                print(error)
            }
        }
    }
}
