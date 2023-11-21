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
  var startDateString: String = ""
  var endDateString: String = ""
  var imageName: String

  var startDate: Date {
    DateFormatter.iso8601.date(from: startDateString) ?? Date()
  }

  var endDate: Date {
    DateFormatter.iso8601.date(from: endDateString) ?? Date()
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

extension DateFormatter {
  static let iso8601: DateFormatter = {
    let formatter
 
=
 
DateFormatter()
    formatter.dateFormat =
 
"yyyy-MM-dd'T'HH:mm:ss.SSSZ"

    
return formatter
  }()
}


struct fetchSubscribesResponse : Decodable {
    let subscribes: [SubscribeModel]
    let message : String
    let statusCode : Int
}
