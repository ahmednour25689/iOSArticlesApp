//
//  MostPopularArticleTableViewCell.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import SDWebImage
import SkeletonView
import UIKit
final class MostPopularArticleTableCell: BaseTableViewCell {
    @IBOutlet private var lblTitle: UILabel!
    @IBOutlet private var lblAuthor: UILabel!
    @IBOutlet private var imgNews: UIImageView!
    @IBOutlet private var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        selectionStyle = .none
        congigureSkeltonView()
    }

    private func congigureSkeltonView() {
        isSkeletonable = true
        [lblTitle,
         lblAuthor,
         imgNews,
         lblDate].forEach {
            $0?.showAnimatedGradientSkeleton()
        }
    }

    internal func config(newsData: Results?) {
        lblTitle.text = newsData?.title
        lblAuthor.text = newsData?.byline
        lblDate.text = newsData?.published_date
        let url = newsData?.media?[safe: 0]?.mediaMetadata?[safe: 0]?.url
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
