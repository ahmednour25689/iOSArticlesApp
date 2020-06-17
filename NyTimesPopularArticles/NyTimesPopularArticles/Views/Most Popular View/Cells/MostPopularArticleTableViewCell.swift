//
//  MostPopularArticleTableViewCell.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import SkeletonView
import UIKit
import SDWebImage
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
        let url = newsData.media?[safe: 0]?.mediaMetadata?[safe: 0]?.url
        guard let imageUrl = url else {
            return
        }
            imgNews.sd_setImage(with: URL(string: imageUrl), completed: nil)
            imgNews.layer.cornerRadius = imgNews.frame.height / 2
            imgNews.clipsToBounds = true
    }
    override func prepareForReuse() {
        lblTitle.text = nil
        lblAuthor.text = nil
        lblDate.text = nil
        imgNews.image = nil
    }
}
extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
