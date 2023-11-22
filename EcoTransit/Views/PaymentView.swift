//
//  PaymentView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 7/11/2023.
//

import SwiftUI

struct PaymentView: View {
    @State private var subscribeModel: SubscribeModel?
    @State private var isCreditCardViewPresented = false
    @State private var discountCode: Double = 0.0

    init(subscribe: SubscribeModel?) {
        self._subscribeModel = State(initialValue: subscribe)
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Payment Information")
                    .font(.largeTitle)
                    .padding()

                if let selectedSubscribe = subscribeModel {
                    VStack {
                        Text("You've selected the \(selectedSubscribe.name).")
                            .font(.headline)
                            .padding()
                        AsyncImageView(url: subscribeModel!.imageName)
                            .frame(width: 100, height: 100)
                    }
                }

                Spacer()

                Button(action: {
                    isCreditCardViewPresented = true
                }) {
                    Text("Pay \(String(format: "%.2f", subscribeModel?.price ?? 0.0)) TND")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.vertical, 10)  // Adjust vertical padding
                        .padding(.horizontal, 20) // Adjust horizontal padding
                }
                
                .padding(.top, -100) // Adjust the value based on your preference

                .sheet(isPresented: $isCreditCardViewPresented) {
                    // Create a binding to the unwrapped subscribeModel
                    let unwrappedSubscribeModelBinding = Binding(
                        get: { subscribeModel ?? SubscribeModel(id: "", name: "", price: 0.0, startDateString: "", endDateString: "", imageName: "") },
                        set: { subscribeModel = $0 }
                    )
                    CreditCardView(subscribe: unwrappedSubscribeModelBinding, discountCode: $discountCode)
                }
            }
            .navigationBarTitle(subscribeModel?.name ?? "Payment")
        }
    }
}




