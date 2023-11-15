//
//  BilletView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//


/*
import SwiftUI

struct Billet: Identifiable, Decodable, Encodable {
    var id = UUID()
    var distance: Double
    var estimatedPrice: Double
    var estimatedTime: String
    var serviceType: String
}

class BilletViewModel: ObservableObject {
    @Published var billets: [Billet] = []

    func fetchBillets() {
        guard let url = URL(string: "http://localhost:3000/api/billets") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedBillets = try JSONDecoder().decode([Billet].self, from: data)
                    DispatchQueue.main.async {
                        self.billets = decodedBillets
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching billets: \(error)")
            }
        }.resume()
    }

    func addBillet(billet: Billet) {
        guard let url = URL(string: "http://localhost:3000/api/billet/add") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            request.httpBody = try JSONEncoder().encode(billet)
        } catch {
            print("Error encoding billet: \(error)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let newBillet = try JSONDecoder().decode(Billet.self, from: data)
                    DispatchQueue.main.async {
                        self.billets.append(newBillet)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error adding billet: \(error)")
            }
        }.resume()
    }
}

struct BilletView: View {
    @ObservedObject private var billetViewModel = BilletViewModel()
    @State private var selectedBillet: Billet?
    @State private var isPayingNow = false

    var body: some View {
        NavigationView {
            List {
                ForEach(billetViewModel.billets) { billet in
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
            .onAppear {
                billetViewModel.fetchBillets()
            }
            .navigationTitle("Billets")
            .navigationBarItems(trailing:
                Button("Add Billet") {
                    let newBillet = Billet(distance: 15.0, estimatedPrice: 19.99, estimatedTime: "25 minutes", serviceType: "Other")
                    billetViewModel.addBillet(billet: newBillet)
                }
            )
            .sheet(item: $selectedBillet) { selectedBillet in
                DetailedBilletView(billet: selectedBillet, isPayingNow: $isPayingNow)
            }
            .background(
                NavigationLink("", destination: SubscriptionView(), isActive: $isPayingNow)
                    .opacity(0)
            )
        }
    }
}

struct DetailedBilletView: View {
    let billet: Billet
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
*/

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
    @State private var isPayingNow = false

    var body: some View {
        NavigationView {
            List {
                ForEach(billets) { billet in
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
            .navigationTitle("Billets")
            .sheet(item: $selectedBillet) { selectedBillet in
                DetailedBilletView(billet: selectedBillet, isPayingNow: $isPayingNow)
            }
            .background(
                NavigationLink("", destination: SubscriptionView(), isActive: $isPayingNow)
                    .opacity(0)
            )
        }
    }
}



struct DetailedBilletView: View {
    let billet: Billet
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
