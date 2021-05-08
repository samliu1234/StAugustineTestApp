//
//  ContentView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-23.
//

import SwiftUI
import CoreData
import GoogleSignIn

struct ContentView: View {
    
    @StateObject var delegate: AppDelegate
    
    var body: some View {
        VStack {
            TabsView()
        }
        .onAppear {
            GIDSignIn.sharedInstance().presentingViewController = UIApplication.shared.windows.first?.rootViewController
            GIDSignIn.sharedInstance().signIn()
        }
    }
}
