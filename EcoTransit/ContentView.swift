//
//  ContentView.swift
//  EcoTransit
//
//  Created by MedAmineLarbi on 5/11/2023.
//

import SwiftUI
import CoreData
/* 
struct ContentView: View {
   @State var currentTab: Tab = .Notification

    // Hide Native Bar
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        TabView(selection: $currentTab) {
            Text("Home View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(""))
                .tag(Tab.Home)
            Text("Search View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(""))
                .tag(Tab.Search)
            Text("Notification View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(""))
                .tag(Tab.Notification)
            Text("Profile View")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(""))
                .tag(Tab.Profile)

            NavigationLink(destination: SubscriptionView()) {
                Text("Subscription View")
            }
            .tag(Tab.Subs)

            NavigationLink(destination: BilletView()) {
                Text("Billet View")
            }
            .tag(Tab.Billet)
        }
        .overlay(
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
            },
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }

    func TabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }, label: {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(currentTab == tab ? .primary : .secondary)
                        .padding(currentTab == tab ? 15 : 0)
                        .background(
                            ZStack {
                                if currentTab == tab {
                                    MaterialEffect(style: .light)
                                        .clipShape(Circle())
                                    Text(tab.tabName).foregroundColor(.primary)
                                        .font(.footnote).padding(.top, 50)
                                }
                            })
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -35 : 0)
                }
            })
        }
        .frame(height: 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    case Profile = "person"
    case Subs = "creditcard"
    case Billet = "ticket"

    var tabName: String {
        switch self {
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Notification:
            return "Notifications"
        case .Profile:
            return "Profile"
        case .Subs:
            return "Subs"
        case .Billet:
            return "Billet"
        }
    }
}

// Safe area
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        //
    }
}
*/
