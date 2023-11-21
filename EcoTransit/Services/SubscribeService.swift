//
//  SubscribeService.swift
//  EcoTransit
//
//  Created by amine on 21/11/2023.
//

import Foundation
import Alamofire
import SwiftUI

struct SubscribeService {
    func fetchSubscribes(completion: @escaping (Result<[SubscribeModel], Error>) -> Void) {
        AF.request("\(Network.fetchSubscribeUrl)", method: .get, encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    // Print raw JSON string for debugging
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("Raw JSON String: \(jsonString)")
                    }

                    do {
                        let decodedData = try JSONDecoder().decode(fetchSubscribesResponse.self, from: data)
                        completion(.success(decodedData.subscribes))
                    } catch {
                        print("Error decoding JSON: \(error)")
                        completion(.failure(error))
                    }

                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completion(.failure(error))
                }
            }
    }
}


