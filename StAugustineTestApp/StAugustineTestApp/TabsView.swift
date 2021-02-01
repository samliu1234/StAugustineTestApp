//
//  TabsView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI
/*
struct ColorManager {
    static let pColor = Color("primaryColor")
}*/

struct TabsView: View {
    
    // @EnvironmentObject var database: Database
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("primary color"))
        //self.database.getCafeMenu()
        
    }
    
    @State var selection = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }.tag(2)
            
            CafMenuTestView()
                .tabItem {
                    Image(systemName: "moon")
                    Text("Cafe Menu")
                }.tag(3)
            
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }.tag(1)
            
            SongRequestView()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Song Requests")
                }.tag(4)
            
            SocialView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Social")
                }.tag(5)
            
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
