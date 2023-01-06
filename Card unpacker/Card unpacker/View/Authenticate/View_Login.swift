//
//  View_Login.swift
//  Card unpacker
//
//  Created by delano sergeant on 06/01/2023.
//

import SwiftUI
import Firebase

struct View_Login: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var model_Auth: Model_Auth
    
    @FocusState var isTextInputEmailFocus : Bool
    @FocusState var isTextInputPasswordFocus : Bool
    
    @State var email = ""
    @State var password = ""
    @State var wrongCredentials = false
    @State var showNextView = false
    
    
    init(){
        do { try Auth.auth().signOut() }
        catch {
            print("cant log out")
            
        }
    }
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView{
                    Group{
                        Spacer().frame(height: 20)
                        HStack{ Text("ChatBuddy").padding().foregroundColor(.orange).font(.largeTitle) }
                        Spacer().frame(height: 30)
                    }
                    
                    Group{
                        TextField("Email", text: $email).focused($isTextInputEmailFocus)
                        SecureField("Password", text: $password).focused($isTextInputPasswordFocus)
                    }.onTapGesture {}
                    .padding().background(RoundedRectangle(cornerRadius: 50)
                                            .foregroundColor(colorScheme == .dark ? Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255) : Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)))
                    
                    Group{
                        Spacer().frame(height: 20)
                        if wrongCredentials { Text("Email/password combination is incorrect").padding().foregroundColor(.red) }
                        NavigationLink(destination: ContentView().environmentObject(model_Auth)) { Text("Sign in") }
                        Button(action: { login() }) { Text("Sign in") }.padding(.top)
                        Spacer().frame(height: 40)
                        NavigationLink(destination: View_Register().environmentObject(model_Auth)) { Text("Sign up") }
                        Spacer()
                    }
                }
            }.onTapGesture {
                if isTextInputEmailFocus {isTextInputEmailFocus = false}
                if isTextInputPasswordFocus {isTextInputPasswordFocus = false }
            }
            .padding().navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }.navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }

     func login() {
         model_Auth.login(email: email, password: password) { result in
             if result {
                 wrongCredentials = false
                 showNextView = true
             } else {
                 wrongCredentials = true
                 showNextView = false
             }
         }
     }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        View_Login()
            .preferredColorScheme(.light)
        View_Login()
            .preferredColorScheme(.dark)
    }
}
