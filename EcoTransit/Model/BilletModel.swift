//
//  BilletModel.swift
//  EcoTransit
//
//  Created by amine on 19/11/2023.
//

import Foundation

struct BilletModel: Codable {
    var distance: Double
    var estimatedPrice: Double
    var estimatedTime: String
    var serviceType: String
}
struct fetchBilletsResponse : Decodable {
    let billets : [Billet]
    let message : String
    let statusCode : Int
}
