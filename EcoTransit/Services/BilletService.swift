//
//  BilletService.swift
//  EcoTransit
//
//  Created by amine on 19/11/2023.
//

import Foundation
import Alamofire
import SwiftUI

struct BilletService {
    func fetchBillets(completion: @escaping (Result<[BilletModel], Error>) -> Void) {
        AF.request("\(Network.fetchBilletUrl)", method: .get, encoding: JSONEncoding.default)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode(fetchBilletsResponse.self, from: data)
                        completion(.success(decodedData.billets))
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



