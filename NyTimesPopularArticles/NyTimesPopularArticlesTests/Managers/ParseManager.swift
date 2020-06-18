//
//  ParseManager.swift
//  NyTimesPopularArticlesTests
//
//  Created by Ahmed Nour on 6/18/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
class ParseManager<T: Codable> {
    func parseAndLoadJson(filename fileName: String) -> T? {
        if let url = Bundle(for: ParseManager.self).url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let dataDecoded = try decoder.decode(T.self, from: data)
                return dataDecoded

            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
