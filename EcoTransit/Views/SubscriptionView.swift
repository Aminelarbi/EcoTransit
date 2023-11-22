import SwiftUI

struct SubscriptionView: View {
    @ObservedObject private var viewModel = SubscribeViewModel()
    @State private var selectedSubscribe: SubscribeModel?

    var body: some View {
        NavigationView {
            List(viewModel.subscribes) { subscribe in
                NavigationLink(destination: PaymentView(subscribe: selectedSubscribe)) {
                    HStack {
                        AsyncImageView(url: subscribe.imageName)
                          
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            
                            .cornerRadius(50)

                        VStack(alignment: .leading) {
                            Text(subscribe.name).font(.headline)
                            Text(String(format: "%.2f", subscribe.price))
                        }
                    }
                    .onTapGesture {
                        selectedSubscribe = subscribe
                    }
                }
            }
            .navigationTitle("Subscription")
            .navigationBarItems(trailing: Button(action: { viewModel.fetchSubscribes()
                
            })  {
                Image(systemName: "arrow.clockwise")
            })
            .onAppear {
                viewModel.fetchSubscribes()
            }
        }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}








