//
//  ContentView.swift
//  Memorize
//
//  Created by Dmitrii Nazarov on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","💀","🕷️","⚰️","⚰️","⚰️","⚰️","⚰️","⚰️","⚰️","⚰️"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            Text("Memorize")
                .font(.largeTitle)
            ScrollView{
                cards
                
            }
            Spacer()
            HStack{
                
            }
            Button("peace"){
                
            }
            cardCountAdjusters
            
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(), GridItem(),GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis [index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image (systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle")
    }
    
    var cardAdder: some View{
        cardCountAdjuster(by: 1, symbol: "plus")
    }
}
struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
