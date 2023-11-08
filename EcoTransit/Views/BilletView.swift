//
//  BilletView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//

import SwiftUI

struct Billet: Identifiable {
    var id = UUID()
    var distance: Double
    var estimatedPrice: Double
    var estimatedTime: String
    var serviceType: String
}

struct BilletView: View {
    @State private var billets: [Billet] = [
        Billet(distance: 10.5, estimatedPrice: 15.99, estimatedTime: "20 minutes", serviceType: "Bus"),
        Billet(distance: 8.2, estimatedPrice: 12.99, estimatedTime: "15 minutes", serviceType: "Taxi"),
        Billet(distance: 8.2, estimatedPrice: 12.99, estimatedTime: "15 minutes", serviceType: "moto"),
        Billet(distance: 8.2, estimatedPrice: 12.99, estimatedTime: "15 minutes", serviceType: "Taxi"),
        Billet(distance: 8.2, estimatedPrice: 12.99, estimatedTime: "15 minutes", serviceType: "moto"),
        // Add more Billet entries as needed
    ]

    @State private var selectedBillet: Billet?

    var body: some View {
        NavigationView {
            List(billets) { billet in
                HStack {
                    Image(billet.serviceType + "Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 10)

                    VStack(alignment: .leading) {
                        Text("Distance: \(String(format: "%.1f", billet.distance))km")
                        Text("Estimated Price: \(String(format: "%.2f", billet.estimatedPrice))dt")
                        Text("Estimated Time: \(billet.estimatedTime)")
                    }
                }
                .padding()
                .background(Color("background"))
                .cornerRadius(10)
                .foregroundColor(.black)
                .onTapGesture {
                    selectedBillet = billet
                }
            }
            .navigationTitle("Billets")
            .sheet(item: $selectedBillet) { selectedBillet in
                DetailedBilletView(billet: selectedBillet)
            }
        }
    }
}
struct DetailedBilletView: View {
    let billet: Billet

    var body: some View {
        VStack {
            Spacer() // Push content to the center of the screen
            Text("Details for Selected Ticket")
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center) // Center text horizontally

            Image(billet.serviceType + "Icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding()

            VStack(alignment: .center) {
                Text("Service Type: \(billet.serviceType)")
                    .font(.headline)
                    .padding(.bottom, 5)

                Text("Distance: \(String(format: "%.1f", billet.distance))km")
                Text("Estimated Price: \(String(format: "%.2f", billet.estimatedPrice))dt")
                Text("Estimated Time: \(billet.estimatedTime)")
            }
            .padding()

            Spacer() // Push content to the center of the screen
        }
        .navigationBarTitle("Ticket Details")
    }
}



struct BilletView_Previews: PreviewProvider {
    static var previews: some View {
        BilletView()
    }
}
