//
//  PaymentInformationView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 7/11/2023.
//


import SwiftUI

struct PaymentInformationView: View {
    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""
    @State private var cardholderName = ""
    @State private var password = ""

    @State private var isCardValid = false
    @State private var isPasswordValid = false

    let subscription: Subscription // Add this property to receive the subscription

    var body: some View {
        Form {
            Section(header: Text("Credit Card Information")) {
                TextField("Card Number", text: $cardNumber)
                    .onChange(of: cardNumber, perform: { newValue in
                        isCardValid = isValidCardNumber(newValue)
                    })

                TextField("Expiration Date", text: $expirationDate)
                    // Add validation for expiration date if needed

                TextField("CVV", text: $cvv)
                    // Add validation for CVV if needed

                TextField("Cardholder Name", text: $cardholderName)
                    // Add validation for cardholder name if needed
            }

            Section(header: Text("Payment Password")) {
                SecureField("Credit Card Password", text: $password)
                    .onChange(of: password, perform: { newValue in
                        isPasswordValid = isValidPassword(newValue)
                    })
            }

            if isCardValid && isPasswordValid {
                Button("Pay $\(String(format: "%.2f", subscription.price))") {
                    // Implement your payment logic here if both card and password are valid
                }
                .font(.title)
                .padding()
            } else {
                Text("Please enter valid card information and password.")
                    .foregroundColor(.red)
            }
        }
        .navigationBarTitle("Payment Information")
    }

    func isValidCardNumber(_ cardNumber: String) -> Bool {
        // Implement card number validation logic here
        // Return true if the card number is valid; otherwise, return false
        return cardNumber.count >= 16 // Basic example: check for a minimum length
    }

    func isValidPassword(_ password: String) -> Bool {
        // Implement password validation logic here
        // Return true if the password is valid; otherwise, return false
        return password.count >= 8 // Basic example: check for a minimum length
    }
}

