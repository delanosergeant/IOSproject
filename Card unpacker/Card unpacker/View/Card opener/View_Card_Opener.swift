//
//  View_Card_Opener.swift
//  Card unpacker
//
//  Created by delano sergeant on 07/01/2023.
//

import SwiftUI

struct View_Card_Opener: View {
    
    @Environment(\.colorScheme) var colorScheme
    let db:FirebaseDB = FirebaseDB()
    @EnvironmentObject var model_Auth : Model_Auth
    
    @ObservedObject var Pack: ViewModel = ViewModel(pack: true)

    
    @Namespace private var cardSpace
    
    var body: some View{
        VStack{
            VStack{
                AspectRatioVGrid(
                    Pack.cards, aspectRatio: 3/4, spacing:10){card in
                        
                        View_Card(card: card)
                            .matchedGeometryEffect(id: card.id, in: cardSpace)
                            .zIndex(zIndex(for:card))
                            .foregroundColor(.blue)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.5)){
                                    Pack.flip(card)
                                }
                            }
                    }
            }
            .onAppear{
                refresh()
            }
            .onDisappear{
                refresh()
            }
            .padding()
            .navigationTitle("Pack opening")
            
            Button(action: { refresh() }) { Text("Open") }.padding().background(RoundedRectangle(cornerRadius: 50)
            .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
            .frame(width: 200, height: 40, alignment:.bottom)
            
          
        }
    }
    
    private func zIndex(for card: CardView<Card>) -> Double {
        return Double(-Pack.cards.firstIndex{$0.id == card.id}!)
        
    }
    
    private func refresh(){
        Pack.generatePack()
    }
}


struct timer: View{
    @State var currentdate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body : some View{
        Text("\(currentdate)")
            .onReceive(timer){ input in
                currentdate = input
            }
    }
}
