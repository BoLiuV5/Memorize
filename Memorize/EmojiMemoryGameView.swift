//
//  ContentView.swift
//  Memorize
//  View(mVvm)
//  Created by Bo on 10/31/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
//    let emojis = ["😘","🥰","😒","😭","😂","😳","🥹","🤣","🥲","😙","😋","😛","🤪","🥳","😖","😡","😱","😎"]
//    @State var cardCount: Int = 4
    
   
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
//            Spacer()
//            cardCountAdjusters
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:90),spacing: 0)], spacing: 0){
            ForEach(viewModel.cards.indices, id: \.self) {index in
                CardView(viewModel.cards[index])    //CardView(card: viewModel.cards[index]) is redundant, init the card in the below struct CardView to get rid of card
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
    
//    var cardCountAdjusters: some View {
//        HStack{
//            cardRemover
//            Spacer()
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//            cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "rectangle.badge.minus")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: 1, symbol: "rectangle.badge.plus")
//    }
}

struct CardView: View {
//    let content: String
//    @State var isFaceUp = true
    
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
////        .onTapGesture {
////            isFaceUp.toggle()
//        }
    }
}
    


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
