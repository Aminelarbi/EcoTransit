// Home.swift

import SwiftUI

struct Home: View {
    // MARK: View Bounds
    var size: CGSize
    var safeArea: EdgeInsets
    // MARK: Gesture Properties
    @State var offsetY: CGFloat = 0
    @State var currentCardIndex: CGFloat = 0
    var body: some View {
        VStack(spacing: 0){
            // HeaderView is removed
            PaymentCardsView()
                .zIndex(0)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
    }
    
    // MARK: Credit Cards View
    @ViewBuilder
    func PaymentCardsView() -> some View {
        VStack {
            Text("SELECT YOUR PAYMENT METHOD")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical)

            GeometryReader { _ in
                VStack(spacing: 0) {
                    ForEach(sampleCards.indices, id: \.self) { index in
                        CardView(index: index)
                    }
                }
                .padding(.horizontal, 30)
                .offset(y: offsetY)
                .offset(y: currentCardIndex * -200.0)

                // MARK: Gradient View
                Rectangle()
                    .fill(.linearGradient(colors: [
                        .clear,
                        .clear,
                        .clear,
                        .clear,
                        .white.opacity(0.1),
                        .white.opacity(0.75),
                        .white
                    ], startPoint: .top, endPoint: .bottom))
                    .allowsHitTesting(false)
            }
            .coordinateSpace(name: "SCROLL")
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged { value in
                    // Decreasing Speed
                    offsetY = value.translation.height * 0.3
                }.onEnded { value in
                    let translation = value.translation.height
                    withAnimation(.easeInOut) {
                        // MARK: Increasing/Decreasing Index Based on Condition
                        // 100 -> Since Card Height = 200
                        if translation > 0 && translation > 100 && currentCardIndex > 0 {
                            currentCardIndex -= 1
                        }
                        if translation < 0 && -translation > 100 && currentCardIndex < CGFloat(sampleCards.count - 1) {
                            currentCardIndex += 1
                        }

                        offsetY = .zero
                    }
                }
        )
        .background {
            Color.white
                .ignoresSafeArea()
        }
    }
    
    // MARK: Card View
    @ViewBuilder
    func CardView(index: Int)->some View{
        GeometryReader{proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / size.height
            let constrainedProgress = progress > 1 ? 1 : progress < 0 ? 0 : progress
            
            Image(sampleCards[index].cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
                // MARK: Shadow
                .shadow(color: .black.opacity(0.14), radius: 8, x: 6, y: 6)
                // MARK: Stacked Card Animation
                .rotation3DEffect(.init(degrees: constrainedProgress * 40.0), axis: (x: 1, y: 0, z: 0), anchor: .bottom)
                .padding(.top,progress * -160.0)
                // Moving Current Card to the Top
                .offset(y: progress < 0 ? progress * 250 : 0)
        }
        .frame(height: 200)
        .zIndex(Double(sampleCards.count - index))
        .onTapGesture {
            print(index)
        }
    }
}




struct Card: Identifiable{
    var id: UUID = .init()
    var cardImage: String
    /// Other Properties
}

var sampleCards: [Card] = [
    .init(cardImage: "Card 1"),
    .init(cardImage: "Card 2"),
    .init(cardImage: "Card 3"),
    .init(cardImage: "Card 4"),
    .init(cardImage: "Card 5"),
    .init(cardImage: "Card 6"),
    .init(cardImage: "Card 7"),
    .init(cardImage: "Card 8"),
    .init(cardImage: "Card 9"),
    .init(cardImage: "Card 10"),
]
