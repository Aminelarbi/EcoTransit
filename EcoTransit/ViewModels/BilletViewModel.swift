//
//  BilletViewModel.swift
//  EcoTransit
//
//  Created by amine on 19/11/2023.
//

import Foundation
import SwiftUI

class BilletViewModel: ObservableObject {
    
    @Published var billets: [Billet] = []
    
    @Published var isLoading = true
    
    @Published var message: String = ""

    
    
    func fetchGuides() {
        BilletService().fetchBillets(){ result in
            switch result {
                
            case.success(let data):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if data?.statusCode == 200 {
                        self.isLoading = false
                        self.billets = data?.billets ?? []
                    }
                    self.message = data?.message ?? ""
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
