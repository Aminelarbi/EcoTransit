//
//  SubscribeModel.swift
//  EcoTransit
//
//  Created by amine on 21/11/2023.
//



import Foundation

struct SubscribeModel: Identifiable, Decodable {
    var id: String
    var name: String
    var price: Double
    var startDateString: String? // Change this to match your JSON
    var endDateString: String?   // Change this to match your JSON
    var imageName: String

    var startDate: Date {
        DateFormatter().date(from: startDateString!) ?? Date()
    }

    var endDate: Date {
        DateFormatter().date(from: endDateString!) ?? Date()
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case price
        case startDateString
        case endDateString
        case imageName
    }
}


struct fetchSubscribesResponse : Decodable {
    let subscribes: [SubscribeModel]
    let message : String
    let statusCode : Int
}
