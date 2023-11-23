//
//  paymentviewf.swift
//  EcoTransit
//
//  Created by Apple Esprit on 23/11/2023.
//

import SwiftUI

struct paymentviewf: View {
    @StateObject var viewModel = PaymentViewModel()
    @State private var amount: String = ""
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvv: String = ""
    @State private var cardHolderName: String = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    Group {
                        Text("Payment Details")
                            .font(.headline)
                            .padding(.top)
                            .foregroundColor(.green)

                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Card Number", text: $cardNumber)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onChange(of: cardNumber) { newCardNumber in
                                // Limit the input to 16 digits
                                if newCardNumber.count > 16 {
                                    cardNumber = String(newCardNumber.prefix(16))
                                }
                            }

                        HStack {
                            TextField("Expiry (MM/YY)", text: $expiryDate)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: expiryDate) { newExpiryDate in
                                    // Limit the input to 5 characters (MM/YY)
                                    if newExpiryDate.count > 5 {
                                        expiryDate = String(newExpiryDate.prefix(5))
                                    }
                                }

                            TextField("CVV", text: $cvv)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .onChange(of: cvv) { newCVV in
                                    // Limit the input to 3 digits
                                    if newCVV.count > 3 {
                                        cvv = String(newCVV.prefix(3))
                                    }
                                }
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                        TextField("Card Holder Name", text: $cardHolderName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }

                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }

                    Button(action: {
                        processPayment()
                    }) {
                        Text("Pay Now")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top)
                    }
                    .disabled(viewModel.isLoading)

                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
                .padding()
            }
    
            .background(Color(red: 0.06, green: 0.09, blue: 0.13))

        }
        
    }

    private func processPayment() {
        guard let amountDouble = Double(amount), let cardNumberInt = Int(cardNumber), let cvvInt = Int(cvv),
              !expiryDate.isEmpty, !cardHolderName.isEmpty else {
            viewModel.errorMessage = "Please fill all fields correctly"
            return
        }
        
        // Now you can use amountDouble, cardNumberInt, cvvInt, expiryDate, and cardHolderName in your payment processing logic.
        viewModel.addPayment(amount: amountDouble)
    }
}

struct paymentViewF_Previews: PreviewProvider {
    static var previews: some View {
        paymentviewf()
    }
}
