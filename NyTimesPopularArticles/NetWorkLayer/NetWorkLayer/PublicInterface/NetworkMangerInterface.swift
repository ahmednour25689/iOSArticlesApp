//
//  NetworkMangerInterface.swift
//  NetworkLayer
//
//  Created by Ahmed Nour on 6/14/20.
//  Copyright © 2020 Ahmed Nour. All rights reserved.
//

import Foundation
public class NetworkMangerInterface {
  public  static func createNetworkMangerInstance(baseUrl : String,path:String,params:[String : String])->NetworkManager{
        return NetworkManager(baseUrl: baseUrl, path: path, params: params)
    }
}
