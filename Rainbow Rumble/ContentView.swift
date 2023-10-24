//
//  ContentView.swift
//  Rainbow Rumble
//
//  Created by Bulut Kalfazade on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    private var sixColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    
    var body: some View {
        GeometryReader{geo in
            VStack{
                Text("Rainbow Rumble")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                    ForEach (cards){card in
                        CardView(card: card,
                                 width: Int(geo.size.width/4-10),
                                 MatchedCards: $MatchedCards,
                                 UserChoices: $UserChoices)
                    }
                }
                
                VStack{
                    Text("Match these cards to win:")
                    LazyVGrid(columns:sixColumnGrid, spacing: 5 ){
                        ForEach (cardValues, id:\.self){cardValue in
                            if !MatchedCards.contains(where: {$0.text == cardValue}){
                                Text(cardValue)
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
