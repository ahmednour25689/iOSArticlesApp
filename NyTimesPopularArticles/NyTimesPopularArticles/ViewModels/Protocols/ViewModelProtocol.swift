//
//  ViewModelProtocol.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/17/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
protocol ViewModelViewProtocol: class {
    func didGetDataWithSuccess(data: [Serializable]?)
    func didFailedWithError(error: Serializable)
}

protocol ViewModelProtocol: class {
    var viewtitle: String { get }
    var tableRowEstimatedHeight: Double { get }
    var viewModelViewDelegate: ViewModelViewProtocol? { get set }
    func getData(with urlComponts: ApiUrlComponent)
}
