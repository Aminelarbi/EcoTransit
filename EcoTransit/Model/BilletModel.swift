//
//  BilletModel.swift
//  EcoTransit
//
//  Created by amine on 19/11/2023.
//

import Foundation

struct BilletModel: Identifiable, Decodable {
    var id: String // replace String with the actual type of your identifier
    var distance: Double
    var estimatedPrice: Double
    var estimatedTime: String
    var serviceType: String
    enum CodingKeys: String, CodingKey {
            case id = "_id" // Match this to the actual key in your JSON data
            case distance
            case estimatedPrice
            case estimatedTime
            case serviceType
        }
}
struct fetchBilletsResponse : Decodable {
    let billets: [BilletModel]
    let message : String
    let statusCode : Int
}
