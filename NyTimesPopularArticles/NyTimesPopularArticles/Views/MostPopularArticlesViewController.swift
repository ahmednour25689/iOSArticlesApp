//
//  MostPopularArticlesViewController.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import UIKit
import NetworkLayer
class MostPopularArticlesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    private var dataManager : DataManager<[Results]>?
    private var dataSourceProvider : DataSourceProvider<Results>?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
               navigationItem.largeTitleDisplayMode = .always
           
        // Do any additional setup after loading the view.
        registerNib()
        getData()
    }
    func registerNib(){
        tableView.register(UINib.init(nibName: "MostPopularArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "MostPopularArticleTableViewCell")
    }
    func getData(){
        let manger = NetworkMangerInterface<BaseResponse>.createNetworkMangerInstance(baseUrl : "api.nytimes.com",path:"/svc/mostpopular/v2/viewed/1.json",params:["api-key" : "jCMYgbYCbRPGDwkDKjb9Avhj41E1MVGn"])
                manger.getData { result in
                   switch result {
                   case .success(let data):
                    self.dataManager = DataManager(dataItems: data.results ?? [])
                        self.dataSourceProvider = DataSourceProvider(dataManager: self.dataManager!)
                        DispatchQueue.main.async {                            
                            self.tableView.dataSource = self.dataSourceProvider
                            self.tableView.delegate = self.dataSourceProvider
                            self.tableView.reloadData()
                        }
                       
                    
                   case .failure(let error):
                       print(error)
                   }
                   
               }
    }
   

}
