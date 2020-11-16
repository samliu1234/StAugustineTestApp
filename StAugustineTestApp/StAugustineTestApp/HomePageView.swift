//
//  HomePageView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-23.
//

import SwiftUI

struct HomePageView: View {
    
    @EnvironmentObject var database: Database
    
    var pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    
    var body: some View {
        
        //HomePageView().environmentObject(database)
        
        ScrollView {
            // Entire view
            VStack {
                
                // MARK: Welcome block
                HStack {
                    
                    // Welcome text
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Welcome \nJohn Doe")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Text("Saturday, November 12 \nCohort A")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: true, vertical: false)
                        
                    }
                    
                    // Sta logo
                    Image("stalogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading)
                    
                }
                
                // Properties for welcome block
                .padding(.all, 25)
                .background(pColor)
                .cornerRadius(20)
                .padding(.all)
                
                
                // MARK: Announcemnts board
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Announcements Board")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Yearbook")
                            .bold()
                            .foregroundColor(pColor)
                        Text("Hi there, yearbook club here. How are y'all doing?")
                            .font(.body)
                            .foregroundColor(pColor)
                    }
                    
                    .padding(.all)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(pColor, lineWidth: 0.75))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Basketball team")
                            .bold()
                            .foregroundColor(pColor)
                        Text("Tryouts start tomorrow everyone! Come out and show us what you got!")
                            .font(.body)
                            .foregroundColor(pColor)
                    }
                    
                    .padding(.all)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(pColor, lineWidth: 0.75))
                    
                }
                
                // Properties for announcement board
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 1))
                .padding(.all)
                
                
                // MARK: Cafe items
                VStack(alignment: .leading) {
                    
                    Text("Featured Cafe Items")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(pColor)
                        .padding(.bottom, 10)
                    
                    HStack(spacing: 15) {
                        
                        // Item 1
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Pizza")
                                .bold()
                                .foregroundColor(pColor)
                            Text("$3.75")
                                .font(.body)
                                .foregroundColor(pColor)
                        }
                        
                        // Item 2
                        .padding(.all)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(pColor, lineWidth: 0.75))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Burger")
                                .bold()
                                .foregroundColor(pColor)
                            Text("$4.50")
                                .font(.body)
                                .foregroundColor(pColor)
                        }
                        
                        .padding(.all)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(pColor, lineWidth: 0.75))
                        
                        // Item 3
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Patty")
                                .bold()
                                .foregroundColor(pColor)
                            Text("$1.50")
                                .font(.body)
                                .foregroundColor(pColor)
                        }
                        
                        .padding(.all)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(pColor, lineWidth: 0.75))
                        
                    }
                    
                }
                
                // Properties for cafe items
                .padding(.all, 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 1))
                .padding(.all)
                
            }
            .onAppear {
                //self.database.getDayNumber()
                //self.database.getCafeMenu()
            }
        }
        
    }
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
