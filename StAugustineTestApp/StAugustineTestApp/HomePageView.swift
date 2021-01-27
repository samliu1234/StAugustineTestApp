//
//  HomePageView.swift
//  StAugustineTestApp
//
//  Created by Matthew Morelli on 2020-10-23.
//

import SwiftUI

struct HomePageView: View {
    
    // @EnvironmentObject var database: Database
    
    let pColor:Color = Color(red: 141/255, green: 18/255, blue: 48/255)
    let yColor:Color = Color(red: 216/255, green: 174/275, blue: 26/255)
    
    @State var items = ["Pizza", "Burger", "Patty"]
    @State var costs = [3.75, 4.50, 2.00]
    @State var grades = [9, 10, 11, 12]
    @State var percentages = [0.7, 0.6, 0.3, 1]
    
    var body: some View {
        
        //HomePageView().environmentObject(database)
        
        GeometryReader { geometry in
            
        
            ScrollView {
                HStack {
                    Spacer()
    
                    // Entire view
                    VStack(spacing: 30) {
                        
                        // MARK: Welcome block
                        HStack {

                            // Welcome text
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("Welcome \nJohn Doe")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("Saturday, November 12 \nCohort A")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                
                            }
                            // Sta logo
                            Image("stalogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.25)
                                .padding(.leading)
                            
                        }
                        // Properties for welcome block
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(yColor, lineWidth: 8)
                        )
                        .background(pColor)
                        .cornerRadius(20)
                        .frame(width: geometry.size.width * 0.8)
                        
                        
                        // MARK: Announcemnts board
                        VStack(spacing: 20) {
                            
                            Text("Announcements Board")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
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
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.8)
                        
                        // MARK: Cafe items
                        VStack {
                        
                            Text("Featured Cafe Items")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            HStack(spacing: 20) {
                                
                                CafeItem(item: $items[0], price: $costs[0])
                                    .frame(width: geometry.size.width * 0.8 / 3)
                                CafeItem(item: $items[1], price: $costs[1])
                                CafeItem(item: $items[2], price: $costs[2])
                             
                            }
  
                        }
                        
                        // Properties for cafe items
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.8)
                        
                        // MARK: Spirit meter
                        VStack {
                            
                            Text("Spirit meter")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            SpiritBar(grade: $grades[0], percentage: $percentages[0])
                            SpiritBar(grade: $grades[1], percentage: $percentages[1])
                            SpiritBar(grade: $grades[2], percentage: $percentages[2])
                            SpiritBar(grade: $grades[3], percentage: $percentages[3])
                            
                        }
                        
                        // Properties for spirit meter
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.8)
                        
                        // MARK: Chaplaincy corner
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Chaplaincy Corner")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            VStack(spacing: 20) {
                                Text("Verse of the Day")
                                    .bold()
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("The Bible is cool!")
                                    .font(.body)
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: geometry.size.width * 0.6)
                            .padding(.all, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(pColor, lineWidth: 0.75))
                            
                   
                            
                        }
                        
                        // Properties for spirit meter
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.8)
                        
                    }
                    Spacer()
                }
                .onAppear {
                    //self.database.getDayNumber()
                    //self.database.getCafeMenu()
                }
            
            }
            
        }
        
    }
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
