//
//  MostPopularArticleTableViewCell.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import UIKit
class MostPopularArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblAuthor : UILabel!
    @IBOutlet weak var imgNews : UIImageView!
    @IBOutlet weak var lblDate : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    func config(newsData : Results){
        lblTitle.text = newsData.title
        lblAuthor.text = newsData.byline
        lblDate.text = newsData.published_date
    }
    override func prepareForReuse() {
        lblTitle.text = nil
        lblAuthor.text = nil
        lblDate.text = nil
    }
}
