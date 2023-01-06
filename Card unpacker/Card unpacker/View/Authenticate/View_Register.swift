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
    @State var userName = ""
    @State var password = ""
    @State var wrongCredentials = false
    @State var noNames = false
    @State var showNextView = false
    @State var showLoginView = false
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView{
                    Group {
                        Spacer().frame(height: 25)
                        HStack{ Text("Card opening simulator").foregroundColor(.blue).font(.largeTitle).padding() }
                        Spacer().frame(height: 25)
                    }
                    Group{
                        TextField("User name", text: $userName).focused($isTextInputUserNameFocus)
                        TextField("Email", text: $email).focused($isTextInputEmailFocus)
                        SecureField("Password", text: $password).focused($isTextInputPasswordFocus)
                    }.onTapGesture{}.padding().background(RoundedRectangle(cornerRadius: 50)
                                            .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                    Group{
                        Spacer().frame(height: 40)
                        if wrongCredentials { Text("Email/password are not valid").padding().foregroundColor(.red) }
                        if noNames { Text("Username cannot be empty").padding().foregroundColor(.red) }
                        NavigationLink(destination: ContentView().environmentObject(model_Auth)) { Text("Sign in") }
                        Button(action: { signUp() }) { Text("Create account") }
                        Spacer().frame(height: 40)
                        NavigationLink(destination: View_Login().environmentObject(model_Auth), isActive: $showLoginView){}
                        Button(action: { showLoginView = true }) { Text("Sign in") }
                        Spacer()
                    }
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
        if !userName.isEmpty {
            model_Auth.signUp(userName: userName, email: email, password: password){ result in
                if result {
                    wrongCredentials = false
                    showNextView = true
                } else {
                    showNextView = false
                    wrongCredentials = true
                }
            }
        } else { noNames = true }
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
