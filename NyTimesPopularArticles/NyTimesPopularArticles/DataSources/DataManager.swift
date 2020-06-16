//
//  DataManager.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
 class DataManager {
    public private(set) var items : [Serializable]
    init(dataItems : [Serializable]) {
        self.items = dataItems
    }
    public var itemsCount: Int {
        return items.count
    }
    public func item(at index: Int) -> Serializable {
        return items[index]
    }
    public func add(item: Serializable) {
        items.append(item)
    }
    public func delete(at index: Int) {
        items.remove(at: index)
    }
    public func edit(item: Serializable, at index: Int) {
        items[index] = item
    }
}
