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
    @Binding var subscribe: SubscribeModel
    @Binding var discountCode: Double
    @State private var total: Double = 0.0
    @State private var isPaymentMethodSelected = false

    init(subscribe: Binding<SubscribeModel>, discountCode: Binding<Double>) {
        self._subscribe = subscribe
        self._discountCode = discountCode
    }

    var body: some View {
        Text("Welcome to \(subscribe.name) Payment Method")
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: SelectCardsView(discountCode: $discountCode, total: $total)) {
                        Text("Choose Payment Method")
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.green)
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
                        .frame(width: 50, height: 50)
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
                        .frame(width: 50, height: 50)

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
                            .background(Color.green.opacity(0.25))
                            .foregroundColor(Color.green)
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
                        .frame(width: 50, height: 50)
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
                            .foregroundColor(.green)
                        Spacer()
                        Text("+ TND \(String(format: "%.2f", total))")
                            .foregroundColor(.green)
                    }
                    Divider()
                    HStack {
                        Text("Discount ")
                            .foregroundColor(.green)
                        Spacer()
                        Text("- TND \(String(format: "%.2f", discountCode))")
                            .foregroundColor(.green)
                    }
                    Divider()
                    HStack {
                        Text("Total")
                            .foregroundColor(.green)
                        Spacer()
                        Text("TND \(String(format: "%.2f", total - discountCode))")
                            .foregroundColor(.green)
                    }
                }.padding()
            }

            Section {
                NavigationLink(destination: paymentviewf()) {
                    Text("Subscribe now")
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.green)
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
        VStack {
            // Display Home view
            Home(size: CGSize(width: 375, height: 667), safeArea: EdgeInsets())

            // Add Card form
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
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct CreditCardView_Previews: PreviewProvider {
    @State static var discountCode: Double = 0.0 // Create a state variable for discountCode

    static var previews: some View {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Use the appropriate date format

        let subscribe = SubscribeModel(id: "someID", name: "Basic Subscription", price: 9.99, startDateString: formatter.string(from: currentDate), endDateString: formatter.string(from: currentDate), imageName: "basicicon") // Corrected endDateString
        let subscribeBinding = Binding.constant(subscribe)

        return CreditCardView(subscribe: subscribeBinding, discountCode: $discountCode)
    }
}
