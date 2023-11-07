//
//  SubscriptionView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//

import SwiftUI

struct Subscription: Identifiable {
    var id = UUID()
    var name :String
    var price : Double
    var startDate: Date
    var endDate: Date
    var imagename : String
    
    func daysRemaining() ->Int{
        let calender = Calendar.current
        let currentDate = Date()
        let remainingDays = calender.dateComponents([.day], from: currentDate, to: endDate)
        return remainingDays.day ?? 0
    }
    
}

struct SubscriptionView : View{

    
    @State private var subscriptions: [Subscription]=[
        Subscription(name: "Basic Subscription", price: 9.99 , startDate: Date(), endDate: Date().addingTimeInterval(80 * 60 * 24 * 30), imagename: "basicicon"),
        Subscription(name: "Silver Subscription", price: 49.99, startDate: Date(), endDate: Date().addingTimeInterval(80 * 60 * 24 * 90), imagename: "silvericon"),
        Subscription(name: "Gold Subscription", price: 99.99, startDate: Date(), endDate: Date().addingTimeInterval(80 * 60 * 24 * 180), imagename: "goldicon")
    ]
    @State private var selectedSubscription: Subscription?
    var body: some View{
        NavigationView{
      
            List(subscriptions){subscription in
                HStack{
                    Image(subscription.imagename)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.trailing ,10)
                        .cornerRadius(50)
                    
                    VStack(alignment: .leading){
                        Text(subscription.name).font(.headline)
                        Text("$\(String(format: "%.2f", subscription.price))").font(.subheadline)
                        
                    }
                    
                }
           
                
                .onTapGesture {
                    selectedSubscription = subscription
                }
                
            }
            .navigationTitle("Choose Subscription")
            .sheet(item: $selectedSubscription){
                subscription in Text("Congratulation you selected the \(subscription.name) for $\(String(format: "%.2f" , subscription.price)).")
                    .font(.title)
                    .padding()
                VStack{
                    Text("Start Date: \(formatDate(subscription.startDate))")
                    Text("End Date: \(formatDate(subscription.endDate))")
                    Text("Days Remaining:\(formatDate(subscription.endDate))")
                }
            }
        }
        
    }
    func formatDate(_ date:Date) ->String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }
    
}
struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
