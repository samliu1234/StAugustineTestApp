//
//  TabsView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-25.
//

import SwiftUI

struct ColorManager {
    static let pColor = Color("primaryColor")
}

struct TabsView: View {
    
    @State var selection = 1
    
    let pColor = UIColor(red: 141/255, green: 18/255, blue: 48/255, alpha: 1)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    // @EnvironmentObject var database: Database
    init() {
        UITabBar.appearance().barTintColor = pColor
        //self.database.getCafeMenu()
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                        //.foregroundColor(.white)
                    //RoundedRectangle(cornerRadius: 20)
                }.tag(1)

            CafMenuTestView()
                .tabItem {
                    Image("restaurant")
                }.tag(2)
            
            AccountView()
                .tabItem {
                    Image("people")
                }.tag(3)
            
            SongRequestView()
                .tabItem {
                    Image("audio")
                }.tag(4)
            
            SocialView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                }.tag(5)
            
        }
        .cornerRadius(20)
        .accentColor(yColor)
        .edgesIgnoringSafeArea(.all)
    }

}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
