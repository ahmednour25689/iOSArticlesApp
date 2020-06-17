//
//  NewsDetailsViewController.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import UIKit
import SDWebImage
final class NewsDetailsViewController: UIViewController {
    @IBOutlet private weak var imgNews: UIImageView!
    @IBOutlet private weak var lblDescription: UILabel!
   private var newsItem: Results
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindDataToView()
    }
    func bindDataToView() {
        lblDescription.text = newsItem.abstract
        let url = newsItem.media?[safe: 0]?.mediaMetadata?[safe: 2]?.url
               guard let imageUrl = url else {
                   return
               }
        imgNews.sd_setImage(with: URL(string: imageUrl), completed: nil)

    }
    init(data: Serializable) {
        let newsDataSerialized = data as? Results
        assert(newsDataSerialized != nil, "cannot parse data")
        self.newsItem = newsDataSerialized!

        super.init(nibName: "NewsDetailsViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
