//
//  SubscribeViewModel.swift
//  EcoTransit
//
//  Created by amine on 21/11/2023.
//

import Foundation
import SwiftUI

class SubscribeViewModel: ObservableObject {
    @Published var subscribes: [SubscribeModel] = []
    @Published var isLoading = true
    @Published var message: String = ""

    func fetchSubscribes() {
        SubscribeService().fetchSubscribes { result in
            switch result {
            case .success(let subscribes):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.subscribes = subscribes
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("Error fetching subscribes: \(error.localizedDescription)")
                    self.message = "Error fetching subscribes: \(error.localizedDescription)"
                }
            }
        }
    }
}

