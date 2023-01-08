//
//  ContentView.swift
//  Card unpacker
//
//  Created by delano sergeant on 05/01/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var model_Auth: Model_Auth
    
    var body: some View {
        VStack {
            Group{
                Spacer().frame(height: 25)
                HStack{ Text("Card opening simulator").foregroundColor(.blue).font(.title).padding() }
                Spacer().frame(height: 25)
            }
            
            Spacer().frame(height: 20)
            
            Group{
                NavigationLink(destination: View_Card_Opener().environmentObject(model_Auth)) { Text("Pack opening") }.background(RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                
                Spacer().frame(height: 40)
                
                NavigationLink(destination: View_Card_Overview().environmentObject(model_Auth)) { Text("Card collection") }.background(RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                
                Spacer().frame(height: 40)
                
                NavigationLink(destination: View_Login().environmentObject(model_Auth)) { Text("Log out") }.background(RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
