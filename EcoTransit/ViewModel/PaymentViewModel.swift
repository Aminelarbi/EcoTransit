//
//  PaymentViewModel.swift
//  EcoTransit
//
//  Created by Apple Esprit on 23/11/2023.
//

import Foundation

class PaymentViewModel: ObservableObject {
    @Published var payment = PaymentModel(amount: 0)
    @Published var isLoading = false
    @Published var errorMessage: String?

    func addPayment(amount: Double) {
        isLoading = true
        payment.amount = amount

        let url = URL(string: "http://localhost:4000/s/api/payment")!
        let payload = ["amount": amount] // Add other required fields

        postRequest(url: url, payload: payload) { result in
            switch result {
            case .success(let data):
                // Process the successful response
                print("Payment Added:", String(data: data, encoding: .utf8) ?? "")
                self.isLoading = false
            case .failure(let error):
                // Handle the error
                print("Error:", error.localizedDescription)
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }

    private func postRequest(url: URL, payload: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
}

