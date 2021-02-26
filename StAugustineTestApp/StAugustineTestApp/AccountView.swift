//
//  AccountView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI

struct AccountView: View {
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                // Button that leads to settings, need to program
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gearshape.fill")
                }
                Text("Account")
            
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
