//
//  ObjectDataSource.swift
//  NyTimesPopularArticles
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
import UIKit
class ObjectDataSource<T:Codable>: NSObject,UITableViewDataSource {
    var items : [T]
     init(items:[Codable]) {
        super.init()
        self.items = items
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
