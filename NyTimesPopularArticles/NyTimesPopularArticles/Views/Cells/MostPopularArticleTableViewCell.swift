//
//  MostPopularArticleTableViewCell.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import SkeletonView
import UIKit
class MostPopularArticleTableViewCell: UITableViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblAuthor: UILabel!
    @IBOutlet var imgNews: UIImageView!
    @IBOutlet var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        isSkeletonable = true
        selectionStyle = .none
        [lblTitle,
         lblAuthor,
         imgNews,
         lblDate].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }
    func config(newsData: Results) {
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
