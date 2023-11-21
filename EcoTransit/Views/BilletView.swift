//
//  BilletView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//



import SwiftUI

struct BilletView: View {
    @ObservedObject private var viewModel = BilletViewModel()
    @State private var selectedBillet: BilletModel?
    @State private var isPayingNow = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.billets) { billet in
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
            }
            .listStyle(GroupedListStyle()) // Specify the list style
            .navigationTitle("Billets")
            .sheet(item: $selectedBillet) { selectedBillet in
                DetailedBilletView(billet: selectedBillet, isPayingNow: $isPayingNow)
            }
            .background(
                NavigationLink("", destination: SubscriptionView(), isActive: $isPayingNow)
                    .opacity(0)
            )
            .onAppear {
                viewModel.fetchBillets()
            }
        }
    }
}


struct DetailedBilletView: View {
    let billet: BilletModel
        @Binding var isPayingNow: Bool

    var body: some View {
        VStack {
            Spacer()
            Text("Details for Selected Ticket")
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)

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

            Spacer()

            Button(action: {
                isPayingNow = true
            }) {
                Text("Pay Now")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
        .navigationBarTitle("Ticket Details")
    }
}






struct BilletView_Previews: PreviewProvider {
    static var previews: some View {
        BilletView()
    }
}
