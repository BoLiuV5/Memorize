//
//  ContentView.swift
//  Memorize
//
//  Created by Bo on 10/31/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            }
            .foregroundColor(.orange)
            .padding()
        }
    }

struct CardView: View {
    var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😘").font(.largeTitle)
            } else {
                base.fill()
            }
        }
    }
}
    


#Preview {
    ContentView()
}
