//
//  MemorizeGame.swift
//  Memorize
//  Model(Mvvm)
//  Created by Bo on 11/3/26.
//

import Foundation


struct MemoryGame<CardContent> {  // CardContent is a madeup don't care (generic) type.
    private(set) var cards: Array<Card>  // private(set) is just like private, but it means only stting this variable is private. Looking at the variable is allowed.
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)  -> CardContent) {    // the above variable cards is private(set), it can only be used in this struct, so it doesn't make sense to show as a parameter in the EmojiMemoryGame file as the parameter of model: MemoryGame<String> = MemoryGame<String>(cards). But the numberOfPairsOfCards of what we might need, so we use it as a parameter and initialize it here. The job inside of an init is to initialize all the vars.
        
        cards = []  // That the reason cards is initialized with an empty array, which equals to Array<Card>() and [Card]()
        
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
   mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
