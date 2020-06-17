//
//  DataManager.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
final class DataManager {
    public private(set) var items: [Serializable]?
    init(dataItems: [Serializable]?) {
        items = dataItems
    }
    public var itemsCount: Int? {
        return items?.count ?? nil
    }
    public func item(at index: Int) -> Serializable? {
        return items?[index]
    }
}
