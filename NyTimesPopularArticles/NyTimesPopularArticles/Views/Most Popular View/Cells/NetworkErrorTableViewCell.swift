//
//  NetworkErrorTableViewCell.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import UIKit
protocol NetworkRetrying: class {
    func didPressRetry()
}
final class NetworkErrorTableViewCell: BaseTableViewCell {
  weak var delegate : NetworkRetrying?
    @IBAction private func retryGettingNews(sender : UIButton) {
      delegate?.didPressRetry()
    }

}
