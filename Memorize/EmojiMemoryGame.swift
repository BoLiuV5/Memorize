//
//  EmojiMemoryGame.swift
//  Memorize
//  ViewModel(mvVM)
//  Created by Bo on 11/6/26.
//

import SwiftUI


class EmojiMemoryGame {    // from the MemorizeGame file, the model, specify the generic CardContent with String
    private static let emojis = ["😘","🥰","😒","😭","😂","😳","🥹","🤣","🥲","😙","😋","😛","🤪","🥳","😖","😡","😱","😎"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in   // can use $0 to replace both index here and below, and the "index in" can be fully deleted, to make things clear, keep the index and replace it with a clearer name pairIndex
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁇"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {  //intent function   //_ means not external name, no argument for caller-side, card is only the name for internal use.
        model.choose(card)
    }
}
