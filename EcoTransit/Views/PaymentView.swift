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
                    Text("You've selected the \(selectedSubscribe.name).")
                        .font(.headline)
                        .padding()
                }

                Spacer()

                Button(action: {
                    isCreditCardViewPresented = true
                }) {
                    Text("Pay \(String(format: "%.2f", subscribeModel?.price ?? 0.0)) TND")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, -20)
                .font(.title)
                .padding(.vertical, -100)
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





/*
import SwiftUI

struct PaymentView: View {
    @State private var subscription: Subscription // Create a state variable for the subscription
    @State private var isCreditCardViewPresented = false
    @State private var discountCode: Double = 0.0 // Add a discountCode state variable

    init(subscription: Subscription) {
        self._subscription = State(initialValue: subscription) // Initialize the state variable
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Payment Information")
                    .font(.largeTitle)
                    .padding()

                Text("You've selected the \(subscription.name).")
                    .font(.headline)
                    .padding()

                Spacer()

                Button(action: {
                               // Show the CreditCardView when the "Pay" button is pressed
                               isCreditCardViewPresented = true
                           }) {
                               Text("Pay \(String(format: "%.2f", subscription.price)) TND")
                                   .font(.title)
                                   .padding()
                                   .frame(maxWidth: .infinity)
                                   .background(Color.green)
                                   .foregroundColor(.white)
                                   .cornerRadius(10)
                           }
                           .padding(.top, -20) // Adjust the top padding to move the button up
                 
               
                .font(.title)
                .padding(.vertical , -100    )
                .sheet(isPresented: $isCreditCardViewPresented) {
                    CreditCardView(subscription: $subscription, discountCode: $discountCode) // Pass the discountCode
                  
                }
                
            }
            .navigationBarTitle("Payment")
        }
    }
}
*/
