//
//  CreditCardView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 7/11/2023.
//

import SwiftUI

struct User {
    var title: String = "Mr"
    var fullName: String = ""
    var nickname: String = ""
    var dateOfBirth: Date = Date()
    var email: String = ""
    var phoneNumber: String = ""
    var discountCode: Double = 0.0
}

struct CreditCardView: View {
    @Binding var subscription: Subscription
    @Binding var discountCode: Double
    @State private var total: Double = 0.0
    @State private var isPaymentMethodSelected = false

    init(subscription: Binding<Subscription>, discountCode: Binding<Double>) {
        self._subscription = subscription
        self._discountCode = discountCode
    }

    var body: some View {
        Text("This is the CreditCardView for \(subscription.name)")
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: SelectCardsView(discountCode: $discountCode, total: $total)) {
                        Text("Choose Payment Method")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationBarTitle("Subscriptions")
        }
    }
}



struct SelectCardsView: View {
    @Binding var discountCode: Double
    @Binding var total: Double
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)

                HStack {
                    Image("paypal")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)

                    Text("Email: example@example.com")
                        .padding(.trailing, 16)

                    Spacer()
                }
            }

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)

                HStack(spacing: 20) {
                    Image("mastercard")
                        .resizable()
                        .frame(width: 24, height: 24)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("*****35322565")
                            .padding(.trailing, 16)

                        Text("Email: express on 21")
                            .foregroundColor(.gray)
                            .padding(.bottom, 16)
                    }
                }.padding()
            }

            Button(action: {
                // Handle the action when the button is tapped
            }) {
                Section {
                    NavigationLink(destination: AddCardView()) {
                        Text("Add Card +")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.blue.opacity(0.25))
                            .foregroundColor(Color.blue)
                            .cornerRadius(20)
                    }
                }
            }

            Text("Other methods")
                .font(.system(size: 16, weight: .semibold))

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)

                HStack(spacing: 20) {
                    Image("cash")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(16)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("Cash Payment")
                            .padding(.trailing, 16)

                        Text("default method")
                            .foregroundColor(.gray)
                            .padding(.bottom, 16)
                    }
                }.padding()
            }

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.gray.opacity(0.15))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 130)
                    .frame(maxWidth: .infinity)

                VStack {
                              HStack {
                                  Text("Subscribe ")
                                      .foregroundColor(.gray)
                                  Spacer()
                                  Text("+ TND \(String(format: "%.2f", total))")
                                      .foregroundColor(.gray)
                              }
                              Divider()
                              HStack {
                                  Text("Discount ")
                                      .foregroundColor(.gray)
                                  Spacer()
                                  Text("- TND \(String(format: "%.2f", discountCode))")
                                      .foregroundColor(.blue)
                              }
                              Divider()
                              HStack {
                                  Text("Total")
                                      .foregroundColor(.gray)
                                  Spacer()
                                  Text("TND \(String(format: "%.2f", total - discountCode))")
                                      .foregroundColor(.gray)
                              }
                          }.padding()
            }

            Section {
                NavigationLink(destination: SecondPaymentView()) {
                    Text("Subscribe now")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
        }.padding(20).navigationTitle("Payment method")
    }
}

struct AddCardView: View {
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""

    var body: some View {
        Image("mastercard1")
            .resizable()
            .frame(width: 24, height: 24)

        VStack(alignment: .leading, spacing: 15) {
            Form {
                Section {
                    TextField("Full Name", text: $fullName)
                    TextField("Card Number", text: $cardNumber)
                    HStack(alignment: .center) {
                        TextField("Cvv", text: $cvv)
                        DatePicker("Date", selection: $date, displayedComponents: .date).padding(2)
                    }
                }
                Text("Add New Card")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct SecondPaymentView: View {
    @State private var fullName = ""
    @State private var cardNumber = ""
    @State private var date = Date()
    @State private var cvv = ""
    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Payment Methods")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Button("Add New Card") {
                    // Action to show the map
                }.foregroundColor(Color.pink)
            }.padding()

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.blue.opacity(0.1))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .frame(height: 400)
                    .frame(maxWidth: .infinity)
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Image("paypal")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        Text("Paypal")
                        Spacer()
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            Circle()
                                .stroke(Color.blue, lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 60)
                        .background(Color.white)
                        .cornerRadius(20)

                    HStack {
                        Image("paypal")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        Text("Paypal")
                        Spacer()
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            Circle()
                                .stroke(Color.blue, lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 60)
                        .background(Color.white)
                        .cornerRadius(20)

                    HStack {
                        Image("paypal")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        Text("Paypal")
                        Spacer()
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            Circle()
                                .stroke(Color.blue, lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 60)
                        .background(Color.white)
                        .cornerRadius(20)

                    Text("Pay with Debit/Credit Card")
                        .font(.system(size: 18, weight: .semibold))
                    HStack {
                        Image("mastercard")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        Text("master card")
                        Spacer()
                        Button(action: {
                            // Handle checkbox toggle logic here
                        }) {
                            Circle()
                                .stroke(Color.blue, lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .foregroundColor(.blue)
                                .padding(.trailing, 16)
                        }
                    }.padding(5)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 60)
                        .background(Color.white)
                        .cornerRadius(20)
                }
            }.padding()

            Button(action: {
                // Handle payment logic here
                showAlert = true
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
            }
            .navigationTitle("Payment method")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Payment Successful"),
                    message: Text("Your payment has been processed."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

enum PaymentMethod: String, Equatable, CaseIterable {
    case creditCard = "Credit Card"
    case cash = "Cash"
    case amen = "Amen"
}

struct CreditCardView_Previews: PreviewProvider {
    @State static var discountCode: Double = 0.0 // Create a state variable for discountCode

    static var previews: some View {
        let subscription = Subscription(name: "Basic Subscription", price: 9.99, startDate: Date(), endDate: Date(), imageName: "basicicon")
        let subscriptionBinding = Binding.constant(subscription) // Create a binding from the subscription

        return CreditCardView(subscription: subscriptionBinding, discountCode: $discountCode)
    }
}
