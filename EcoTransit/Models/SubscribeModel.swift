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

    var startDate: Date? {
        formatDate(startDateString)
    }

    var endDate: Date? {
        formatDate(endDateString)
    }

    private func formatDate(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        return dateFormatter.date(from: dateString)
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
func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}
