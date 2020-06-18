//
//  NetworkErrorTableViewCell.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import UIKit

final class NetworkErrorTableViewCell: BaseTableViewCell {
    weak var delegate: NetworkRetrying?
    @IBAction private func retryGettingNews(sender _: UIButton) {
        delegate?.didPressRetry()
    }
}
