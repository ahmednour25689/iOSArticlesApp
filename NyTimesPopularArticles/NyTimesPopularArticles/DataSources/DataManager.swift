//
//  DataManager.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
 class DataManager<T:Serializable> {
    
    public private(set) var items : [T]
    
    init(dataItems : T) {
        guard let sequenceData = dataItems as? [Serializable] else {
            self.items = []
         return
        }
        self.items = sequenceData 
    }
    
    public var itemsCount: Int {
        return items.count
    }
    
    public func item(at index: Int) -> T {
        return items[index]
    }
    
    public func add(item: T) {
        items.append(item)
    }
    
    public func delete(at index: Int) {
        items.remove(at: index)
    }
    
    public func edit(item: T, at index: Int) {
        items[index] = item
    }
    
}
