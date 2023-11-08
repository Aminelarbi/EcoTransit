import SwiftUI

struct Subscription: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var startDate: Date
    var endDate: Date
    var imageName: String

    func daysRemaining() -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let remainingDays = calendar.dateComponents([.day], from: currentDate, to: endDate)
        return remainingDays.day ?? 0
    }
}

struct SubscriptionView: View {
    @State private var subscriptions: [Subscription] = [
        Subscription(name: "Basic Subscription", price: 9.99, startDate: Date(), endDate: Date().addingTimeInterval(60 * 60 * 24 * 30), imageName: "basicicon"),
        Subscription(name: "Silver Subscription", price: 49.99, startDate: Date(), endDate: Date().addingTimeInterval(60 * 60 * 24 * 90), imageName: "silvericon"),
        Subscription(name: "Gold Subscription", price: 99.99, startDate: Date(), endDate: Date().addingTimeInterval(60 * 60 * 24 * 180), imageName: "goldicon")
    ]

    var body: some View {
        NavigationView {
            List(subscriptions) { subscription in
                NavigationLink(destination: PaymentView(subscription: subscription)) {
                    HStack {
                        Image(subscription.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 10)
                            .cornerRadius(50)

                        VStack(alignment: .leading) {
                            Text(subscription.name).font(.headline)
                            Text((String(format: "%.2f", subscription.price)))
                        }
                    }
                }
            }
            .navigationTitle("Subscription")
            
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}

