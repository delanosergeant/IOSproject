//
//  Card_unpackerApp.swift
//  Card unpacker
//
//  Created by delano sergeant on 05/01/2023.
//

import SwiftUI
import Firebase

@main
struct Card_unpackerApp: App {
    
    var model_Auth: Model_Auth
        
        init() {
           FirebaseApp.configure()
            model_Auth = Model_Auth()
        }

        var body: some Scene {
                    WindowGroup {
                        if model_Auth.auth.currentUser != nil {
                            ContentView().environmentObject(model_Auth)
                        }else{
                            View_Login().environmentObject(model_Auth)
                        }
                    }
                }
    
}
