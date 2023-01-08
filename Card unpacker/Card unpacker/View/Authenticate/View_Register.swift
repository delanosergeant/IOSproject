//
//  View_Register.swift
//  Card unpacker
//
//  Created by delano sergeant on 06/01/2023.
//

import SwiftUI


struct View_Register: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var model_Auth: Model_Auth
    
    @FocusState var isTextInputUserNameFocus : Bool
    @FocusState var isTextInputEmailFocus : Bool
    @FocusState var isTextInputPasswordFocus : Bool
    
    @State var email = ""
    @State var password = ""
    @State var wrongCredentials = false
    @State var showNextView = false
    @State var showLoginView = false
    
    var body: some View {
        NavigationView{
            VStack {
                    Group {
                        Spacer().frame(height: 25)
                        HStack{ Text("Card opening simulator").foregroundColor(.blue).font(.title).padding() }
                        Spacer().frame(height: 25)
                    }
                    
                    Group{
                        TextField("Email:", text: $email).focused($isTextInputEmailFocus)
                        SecureField("Password:", text: $password).focused($isTextInputPasswordFocus)
                    }.onTapGesture{}.padding().background(RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                    
                    Group{
                        Spacer().frame(height: 40)
                        
                        if (wrongCredentials) { Text("Email/password are not valid").padding().foregroundColor(.red) }
                        NavigationLink(destination: ContentView().environmentObject(model_Auth), isActive: $showNextView){}
                        Button(action: { signUp() }) { Text("Create account") }.background(RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                        
                        
                        Spacer().frame(height: 40)
                        
                        NavigationLink(destination: View_Login().environmentObject(model_Auth), isActive: $showLoginView){}
                        Button(action: { showLoginView = true }) { Text("Sign in") }.background(RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                        
                        Spacer()
                    }
                
            }.onTapGesture {
                if isTextInputUserNameFocus { isTextInputUserNameFocus = false }
                if isTextInputEmailFocus { isTextInputEmailFocus = false }
                if isTextInputPasswordFocus { isTextInputPasswordFocus = false }
            }.padding().navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }.navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    
    func signUp() {
        model_Auth.signUp(email: email, password: password){ result in
            if (result) {
                wrongCredentials = false
                showNextView = true
            } else {
                showNextView = false
                wrongCredentials = true
            }
        }
    }
    
    struct View_Register_Previews: PreviewProvider {
        static var previews: some View {
            View_Register()
                .preferredColorScheme(.light)
            View_Register()
                .preferredColorScheme(.dark)
        }
    }
}
