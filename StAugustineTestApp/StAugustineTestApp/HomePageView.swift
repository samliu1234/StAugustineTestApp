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
    let tmpColor = Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.7)
    
    @State var imageNames = ["rotini_pasta", "fish", "chicken_legs"]
    @State var items = ["Rotini Pasta", "Fish", "Chicken Legs"]
    @State var costs = [4.50, 6.50, 4.00]
    @State var grades = [9, 10, 11, 12]
    @State var percentages = [0.7, 0.6, 0.3, 1]
    @State var announcements = [["Yearbook", "Hi there yearbook club here. How are y'all doing?"], ["Basketball team", "Tryouts start tomorrow everyone! Come out and show us what you got!"]]
    
    @Binding var selectionValue: Int
    
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
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text("Saturday, November 12 \nCohort A")
                                    //.font(.body)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13))
                                
                            }
                            
                            Spacer()
                            
                            // Sta logo
                            Image("stalogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width * 0.2)
                                .padding(.leading)
                            
                        }
                        // Properties for welcome block
                        //.frame(width: geometry.size.width * 0.85)
                        .padding(.all, 25)
                        .frame(width: geometry.size.width * 0.85)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(yColor, lineWidth: 8)
                        )
                        .background(pColor)
                        .cornerRadius(20)
                        
                        // MARK: Announcemnts board
                        VStack(spacing: 10) {
                            
                            Text("Announcement Board")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            AnnouncementObject(title: $announcements[0][0], text: $announcements[0][1])
                                .padding(.bottom, 10)
                            AnnouncementObject(title: $announcements[1][0], text: $announcements[1][1])
        
                        }
                        // Properties for announcement board
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                        // MARK: Cafe items
                        VStack {
                            
                            HStack(alignment: .top) {
                                
                                Text("Featured Cafe Items")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(pColor)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 10)
                                
                                Spacer()
                                
                                Button() {
                                    selectionValue = 2
                                } label: {
                                    HStack {
                                        Text("View more")
                                            .foregroundColor(yColor)
                                            .font(.system(size: 12))
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(yColor)
                                            .font(.system(size: 10))
                                    }
                                }
                                

                            }
                            
                            HStack(spacing: 20) {
                                
                                CafeItem(imageName: $imageNames[0], item: $items[0], price: $costs[0])
                                    .frame(width: geometry.size.width * 0.21, height: geometry.size.height * 0.2)
                                
                                CafeItem(imageName: $imageNames[1], item: $items[1], price: $costs[1])
                                    .frame(width: geometry.size.width * 0.21, height: geometry.size.height * 0.2)
                                
                                CafeItem(imageName: $imageNames[2], item: $items[2], price: $costs[2])
                                    .frame(width: geometry.size.width * 0.21, height: geometry.size.height * 0.2)
                               
                            }
  
                        }
                        // Properties for cafe items
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                        // MARK: Spirit meter
                        VStack {
                            
                            Text("Spirit meter")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(pColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 10)
                            
                            SpiritMeter(grade: $grades[0], percentage: $percentages[0], screenWidth: Double(geometry.size.width))
                            
                            SpiritMeter(grade: $grades[1], percentage: $percentages[1], screenWidth: Double(geometry.size.width))
                            
                            SpiritMeter(grade: $grades[2], percentage: $percentages[2], screenWidth: Double(geometry.size.width))
                            
                            SpiritMeter(grade: $grades[3], percentage: $percentages[3], screenWidth: Double(geometry.size.width))
                            
                        }
                        
                        // Properties for spirit meter
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
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
                
                        
                        // Properties for chaplaincy corner
                        .padding(.all, 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0/255, green: 0/255, blue: 0/255, opacity: 0.15), lineWidth: 4))
                        .frame(width: geometry.size.width * 0.85)
                        
                    }
                    Spacer()
                }
                .onAppear {
                    //self.database.getDayNumber()
                    //self.database.getCafeMenu()
                }
                .padding(.bottom, 30)
            
            }
            
        }
        
    }
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(selectionValue: Binding.constant(1))
    }
}
