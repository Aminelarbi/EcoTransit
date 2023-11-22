//
//  Network.swift
//  EcoTransit
//
//  Created by amine on 19/11/2023.
//

import Foundation
struct Network {
    static let BASE_URL = "http://localhost:4000/s/api"
    
    
    
    
    //billets routes
    static let fetchBilletUrl = BASE_URL + "/billets"
    static let fetchSubscribeUrl = BASE_URL + "/subscribes"
    
}
