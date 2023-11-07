//
//  NavigationBarView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var showBillets: Bool
    @Binding var showSubscription : Bool
    var body: some View{
        HStack{
            Button("Billets"){
                showBillets = true
                showSubscription = false
            } .padding()
            Button("Billets"){
                showBillets = false
                showSubscription = true
            }
            .padding()
        }
    }
}

