//
//  BilletViewModel.swift
//  EcoTransit
//
//  Created by amine on 19/11/2023.
//

import Foundation
import SwiftUI

class BilletViewModel: ObservableObject {
    
    @Published var billets: [BilletModel] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""
    
    
    
    func fetchBillets() {
        BilletService().fetchBillets { result in
            switch result {
            case .success(let billets):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.billets = billets
                }
            case .failure(let error):
                print("Error fetching billets: \(error.localizedDescription)")
            }
        }
    }
}
