//
//  ContentView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View{
        Text("h")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

